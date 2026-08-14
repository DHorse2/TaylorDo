Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$moduleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

Get-ChildItem -LiteralPath (Join-Path $moduleRoot 'Private') -Filter '*.ps1' -File |
    Sort-Object Name |
    ForEach-Object { . $_.FullName }

Get-ChildItem -LiteralPath (Join-Path $moduleRoot 'Public') -Filter '*.ps1' -File |
    Sort-Object Name |
    ForEach-Object { . $_.FullName }
