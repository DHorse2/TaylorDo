function New-VmManifest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $DataPath,

        [Parameter(Mandatory)]
        [string] $ManifestPath,

        [ValidateSet('None', 'SHA256')]
        [string] $HashAlgorithm = 'None'
    )

    $parent = Split-Path -Parent $ManifestPath
    $null = New-Item -ItemType Directory -Path $parent -Force

    $writer = [IO.StreamWriter]::new(
        $ManifestPath,
        $false,
        [Text.UTF8Encoding]::new($false)
    )

    try {
        Get-ChildItem -LiteralPath $DataPath -File -Recurse -Force |
            Sort-Object FullName |
            ForEach-Object {
                $relative = $_.FullName.Substring($DataPath.Length).TrimStart('\')
                $hash = $null
                if ($HashAlgorithm -eq 'SHA256') {
                    $hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
                }

                $entry = [ordered]@{
                    pathUtc      = $relative
                    length       = $_.Length
                    lastWriteUtc = $_.LastWriteTimeUtc.ToString('o')
                    sha256       = $hash
                }

                $writer.WriteLine(($entry | ConvertTo-Json -Compress))
            }
    }
    finally {
        $writer.Dispose()
    }

    return Get-Item -LiteralPath $ManifestPath
}
