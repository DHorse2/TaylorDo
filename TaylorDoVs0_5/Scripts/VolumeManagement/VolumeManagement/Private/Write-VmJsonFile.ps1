function Write-VmJsonFile {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [object] $InputObject,

        [Parameter(Mandatory)]
        [string] $Path,

        [int] $Depth = 12
    )

    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        $null = New-Item -ItemType Directory -Path $parent -Force
    }

    $json = $InputObject | ConvertTo-Json -Depth $Depth
    [IO.File]::WriteAllText($Path, $json, [Text.UTF8Encoding]::new($false))
}
