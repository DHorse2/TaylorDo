# Fix-ScriptHeaders.ps1
param(
    [string[]]$Include,
    [string]$Prefix = "# Script: "
)

Write-Host 'Usage: .\Fix-ScriptHeaders.ps1 [-Include "*.MyDc","*.MyD"] [-Prefix "# Script: "]'
Write-Host 'If -Include is omitted, you will be prompted.'

# Prompt if not provided
if (-not $Include -or $Include.Count -eq 0) {
    $patternInput = Read-Host "Enter file patterns (comma separated, e.g. *.MyDc,*.MyD)"
    $Include = $patternInput -split "," | ForEach-Object { $_.Trim() }
}

Write-Host "Processing patterns: $($Include -join ', ')" -ForegroundColor Cyan
Write-Host "Using prefix: $Prefix" -ForegroundColor Cyan

Get-ChildItem -Path ".\*" -Recurse -Include $Include -File | ForEach-Object {
    $file = $_
    $lines = Get-Content $file.FullName

    # Skip empty files
    if ($null -eq $lines -or $lines.Length -eq 0) {
        Write-Host "Skipping empty file: $($file.FullName)" -ForegroundColor Gray
        return
    }

    $expected = "$($Prefix)$($file.BaseName)"

    # Find first non-empty line
    $firstNonEmpty = $lines | Where-Object { $_.Trim() -ne "" } | Select-Object -First 1

    Write-Host "File: $($file.BaseName)"

    # Format if line 1 starts with the file name
    if ($lines[0] -eq "$($file.BaseName)") {
        Write-Host "Name found at top"
        $newLines = @($expected) + $lines[1..($lines.Length - 1)]
        $lines = $newLines
    }
    else {
        # Skip if line 1 already starts with "# Script:"
        if ($lines[0] -match "^$([regex]::Escape($Prefix))") {
            return
        }
    }

    # Show preview
    Write-Host ""
    Write-Host "======================================================" -ForegroundColor Cyan
    Write-Host "File: $($file.FullName)" -ForegroundColor Yellow
    Write-Host "Expected : $expected" -ForegroundColor Green
    Write-Host "Found    : $firstNonEmpty" -ForegroundColor Red
    Write-Host "------------------------------------------------------" -ForegroundColor Cyan
    Write-Host "First few lines:"
    $lines | Select-Object -First 8 | ForEach-Object { Write-Host "  $_" }
    Write-Host "------------------------------------------------------" -ForegroundColor Cyan

    # Prompt
    $response = Read-Host "Insert header line? (Y/N/Q to quit)"

    switch ($response.ToUpper()) {
        "Y" {
            $newLines = @($expected) + $lines
            Set-Content -Path $file.FullName -Value $newLines -Encoding UTF8
            Write-Host "Header inserted." -ForegroundColor Green
        }
        "Q" {
            Write-Host "Quitting." -ForegroundColor Yellow
            exit
        }
        default {
            Write-Host "Skipped." -ForegroundColor Gray
        }
    }
}

Write-Host ""
Write-Host "Done." -ForegroundColor Cyan
