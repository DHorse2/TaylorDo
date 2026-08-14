function Read-VmConfiguration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $Path
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Configuration file not found: $Path"
    }

    $extension = [IO.Path]::GetExtension($Path)
    switch ($extension.ToLowerInvariant()) {
        '.psd1' {
            return Import-PowerShellDataFile -LiteralPath $Path
        }
        '.json' {
            return Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
        }
        default {
            throw "Unsupported configuration format '$extension'. Use .psd1 or .json."
        }
    }
}
