<#
.SYNOPSIS
    MyDefrag Script Preprocessor

.DESCRIPTION
    Recursively resolves !include "..."! directives in MyDefrag scripts,
    producing a merged output file with two line-number columns on every
    content line and single-line BEGIN / END annotations at each include
    boundary.

    Output columns per content line:
        <outLine>  <srcLine>  <content>

        outLine  - running line number in the merged output (content lines only)
        srcLine  - line number within the owning source file (resets per file)

    Annotation lines (BEGIN / END) carry no line numbers and are visually
    distinct via blank numeric columns.

.PARAMETER EntryFile
    Path to the root .MyDc script.

.PARAMETER OutputFile
    Optional. Path for the merged output file.
    Defaults to <EntryFile>.merged.MyDc alongside the entry file.

.PARAMETER DebugMode
    Switch. When set, emits verbose [DBG] trace lines to the console
    (these never appear in the output file).

.PARAMETER IncIncludeLine
    Switch. When set, the !include! directive line does NOT advance the
    parent src line counter - the next parent line shares the same src
    line number as the directive. Use this when the included file is
    inline text with no leading CRLF so the directive does not consume
    a line number in the parent.
    By default (flag absent) the directive counts as a normal line and
    the parent src counter advances by 1 after it.

.EXAMPLE
    .\mydefrag-preprocess.ps1 -EntryFile "C:\MyDefrag\MyScript.MyDc"

.EXAMPLE
    .\mydefrag-preprocess.ps1 "C:\MyDefrag\MyScript.MyDc" "C:\out\preview.MyDc" -DebugMode

.EXAMPLE
    .\mydefrag-preprocess.ps1 "C:\MyDefrag\MyScript.MyDc" -IncIncludeLine
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true,  Position=0)] [string]$EntryFile,
    [Parameter(Mandatory=$false, Position=1)] [string]$OutputFile = "",
    [Parameter(Mandatory=$false)] [switch]$DebugMode,
    [Parameter(Mandatory=$false)] [switch]$IncIncludeLine
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------------------
# Debug helper - writes to host (console) only, never to the output file
# ---------------------------------------------------------------------------
function Dbg([string]$msg) {
    if ($DebugMode) {
        Write-Host "[DBG] $msg" -ForegroundColor DarkCyan
    }
}

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------
$COL_W = 6
$BLANK = " " * $COL_W

# ---------------------------------------------------------------------------
# Formatting helpers
# ---------------------------------------------------------------------------

function Format-Col([int]$n) {
    return ([string]$n).PadLeft($COL_W)
}

function Format-ContentLine([int]$outLine, [int]$srcLine, [string]$text) {
    return "$(Format-Col $outLine)$(Format-Col $srcLine) $text"
}

function Format-AnnotLine([string]$indent, [string]$text) {
    return "$BLANK$BLANK $indent$text"
}

# ---------------------------------------------------------------------------
# Core recursive processor
# ---------------------------------------------------------------------------

function Invoke-ProcessFile {
    param(
        [string]    $FilePath,
        [string[]]  $Stack,
        [hashtable] $State,
        [int]       $Depth
    )

    $absPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($FilePath)
    $indent  = "  " * $Depth

    Dbg "Invoke-ProcessFile: depth=$Depth  absPath=$absPath"
    Dbg "  stack=[$($Stack -join ', ')]"

    # Circular include guard
    if ($Stack -contains $absPath) {
        $cycle = ($Stack + $absPath | ForEach-Object { [System.IO.Path]::GetFileName($_) }) -join " -> "
        $msg   = "ERROR: Circular include: $cycle"
        Write-Warning "[MyDefrag-Preprocess] $msg"
        Dbg "  CIRCULAR INCLUDE - returning error annotation"
        return [PSCustomObject]@{
            Lines    = [System.Collections.Generic.List[string]]@( (Format-AnnotLine $indent "; *** $msg ***") )
            OutStart = $State.Counter + 1
            OutEnd   = $State.Counter
            SrcTotal = 0
        }
    }

    # File existence check
    Dbg "  checking existence: $absPath"
    if (-not (Test-Path -LiteralPath $absPath)) {
        $msg = "ERROR: File not found: $absPath"
        Write-Warning "[MyDefrag-Preprocess] $msg"
        Dbg "  FILE NOT FOUND - returning error annotation"
        return [PSCustomObject]@{
            Lines    = [System.Collections.Generic.List[string]]@( (Format-AnnotLine $indent "; *** $msg ***") )
            OutStart = $State.Counter + 1
            OutEnd   = $State.Counter
            SrcTotal = 0
        }
    }
    Dbg "  file exists OK"

    $State.Visited.Add($absPath)

    # Read all lines
    $rawLines = [System.IO.File]::ReadAllLines($absPath)
    $srcTotal = $rawLines.Count
    Dbg "  read $srcTotal lines"

    $includeRe = [regex]'!include\s+"([^"]+)"!'

    $outLines = [System.Collections.Generic.List[string]]::new()
    $outStart = $State.Counter + 1
    Dbg "  outStart=$outStart  (counter=$($State.Counter))"

    # Walk source lines
    for ($i = 0; $i -lt $rawLines.Count; $i++) {
        $rawLine   = $rawLines[$i]
        $srcLineNo = $i + 1

        Dbg "  line $srcLineNo/$srcTotal : $($rawLine.Substring(0, [Math]::Min(60,$rawLine.Length)))"

        $match = $includeRe.Match($rawLine)

        if ($match.Success) {
            Dbg "    -> INCLUDE: $($match.Groups[1].Value)"

            # Emit the directive line as a numbered content line.
            # When IncIncludeLine is set the directive does not advance $i,
            # so the next parent line re-uses the same srcLineNo.
            $State.Counter++
            Dbg "    directive -> outLine=$($State.Counter) srcLine=$srcLineNo  IncIncludeLine=$($State.IncIncludeLine)"
            $outLines.Add( (Format-ContentLine $State.Counter $srcLineNo $rawLine) )
            if ($State.IncIncludeLine) {
                $i--   # rewind loop counter so next iteration keeps the same srcLineNo
                Dbg "    IncIncludeLine set: rewound i to $i so next srcLineNo stays $srcLineNo"
            }

            $includePath  = $match.Groups[1].Value
            $includeDir   = [System.IO.Path]::GetDirectoryName($absPath)
            $combined     = [System.IO.Path]::Combine($includeDir, $includePath)
            $resolvedPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($combined)

            Dbg "    includePath  = $includePath"
            Dbg "    includeDir   = $includeDir"
            Dbg "    resolvedPath = $resolvedPath"

            $childStack = $Stack + $absPath

            Dbg "    recursing depth=$($Depth+1)..."
            $child = Invoke-ProcessFile `
                -FilePath $resolvedPath `
                -Stack    $childStack `
                -State    $State `
                -Depth    ($Depth + 1)

            Dbg "    child: outStart=$($child.OutStart) outEnd=$($child.OutEnd) srcTotal=$($child.SrcTotal) lines=$($child.Lines.Count)"

            $beginAnnot = Format-AnnotLine $indent `
                "; >>> BEGIN [d:$($Depth+1)] $resolvedPath  src:$($child.SrcTotal)  out:$($child.OutStart)-$($child.OutEnd)"
            $endAnnot = Format-AnnotLine $indent `
                "; <<< END   [d:$($Depth+1)] $resolvedPath  src:$($child.SrcTotal)  out:$($child.OutStart)-$($child.OutEnd)"

            $outLines.Add($beginAnnot)
            foreach ($cl in $child.Lines) { $outLines.Add($cl) }
            $outLines.Add($endAnnot)

        } else {
            $State.Counter++
            Dbg "    -> normal outLine=$($State.Counter) srcLine=$srcLineNo"
            $outLines.Add( (Format-ContentLine $State.Counter $srcLineNo $rawLine) )
        }
    }

    $outEnd = $State.Counter
    Dbg "  done: outStart=$outStart outEnd=$outEnd outLines=$($outLines.Count)"

    return [PSCustomObject]@{
        Lines    = $outLines
        OutStart = $outStart
        OutEnd   = $outEnd
        SrcTotal = $srcTotal
    }
}

# ===========================================================================
# MAIN
# ===========================================================================

Dbg "Script started"
Dbg "EntryFile=$EntryFile  OutputFile=$OutputFile  DebugMode=$DebugMode  IncIncludeLine=$IncIncludeLine"

$entryResolved = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($EntryFile)
Dbg "entryResolved=$entryResolved"

if (-not (Test-Path -LiteralPath $entryResolved)) {
    Write-Error "[MyDefrag-Preprocess] ERROR: Entry file not found: $entryResolved"
    exit 1
}
Dbg "Entry file exists OK"

if ($OutputFile -eq "") {
    $dir  = [System.IO.Path]::GetDirectoryName($entryResolved)
    $base = [System.IO.Path]::GetFileNameWithoutExtension($entryResolved)
    $ext  = [System.IO.Path]::GetExtension($entryResolved)
    $outputResolved = [System.IO.Path]::Combine($dir, "$base.merged$ext")
} else {
    $outputResolved = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFile)
}
Dbg "outputResolved=$outputResolved"

Write-Host "[MyDefrag-Preprocess] Entry  : $entryResolved"
Write-Host "[MyDefrag-Preprocess] Output : $outputResolved"

$state = @{
    Counter        = 0
    Visited        = [System.Collections.Generic.List[string]]::new()
    IncIncludeLine = $IncIncludeLine.IsPresent
}

Dbg "Calling Invoke-ProcessFile..."
$root = Invoke-ProcessFile -FilePath $entryResolved -Stack @() -State $state -Depth 0
Dbg "Root returned: outStart=$($root.OutStart) outEnd=$($root.OutEnd) lines=$($root.Lines.Count)"
Dbg "Visited=$($state.Visited.Count)  Counter=$($state.Counter)"

# Header
$bar    = "=" * 72
$colHdr = "$BLANK$BLANK $("<outLine>".PadLeft($COL_W))$("<srcLine>".PadLeft($COL_W)) <content>"
$header = [System.Collections.Generic.List[string]]::new()
$header.Add("; $bar")
$header.Add("; MyDefrag Preprocessor - Merged Output")
$header.Add("; Generated   : $(Get-Date -Format 'yyyy-MM-ddTHH:mm:ss')")
$header.Add("; Entry       : $entryResolved")
$header.Add("; Output lines: $($state.Counter)  (content lines, excluding annotations)")
$header.Add("; $bar")
$header.Add("; $colHdr")
$header.Add("; $bar")
$header.Add("")
Dbg "Header built ($($header.Count) lines)"

# Footer / include map
$footer = [System.Collections.Generic.List[string]]::new()
$footer.Add("")
$footer.Add("; $bar")
$footer.Add("; INCLUDE MAP  ($($state.Visited.Count) file(s) processed)")
$footer.Add("; $bar")
$fi = 1
foreach ($f in $state.Visited) {
    $footer.Add("; [$( ([string]$fi).PadLeft(3,'0') )]  $f")
    $fi++
}
$footer.Add("; $bar")
Dbg "Footer built ($($footer.Count) lines)"

# Assemble all lines
$allLines = [System.Collections.Generic.List[string]]::new()
foreach ($l in $header)     { $allLines.Add($l) }
foreach ($l in $root.Lines) { $allLines.Add($l) }
foreach ($l in $footer)     { $allLines.Add($l) }
Dbg "Total lines to write: $($allLines.Count)"

# Write output
try {
    [System.IO.File]::WriteAllLines($outputResolved, $allLines, [System.Text.UTF8Encoding]::new($false))
    Dbg "WriteAllLines OK"
} catch {
    Write-Error "[MyDefrag-Preprocess] ERROR writing output: $_"
    exit 1
}

if (Test-Path -LiteralPath $outputResolved) {
    $sz = (Get-Item -LiteralPath $outputResolved).Length
    Dbg "Output confirmed on disk: $sz bytes"
} else {
    Dbg "OUTPUT FILE NOT FOUND after write - something is very wrong"
}

Write-Host "[MyDefrag-Preprocess] Done. $($state.Visited.Count) file(s), $($state.Counter) content lines."
Write-Host "[MyDefrag-Preprocess] Output written to: $outputResolved"
Dbg "Script finished"
