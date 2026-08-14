function Test-VmStorageRun {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string] $Path,

        [switch] $VerifyHashes
    )

    process {
        $runPath = (Resolve-Path -LiteralPath $Path).Path
        $manifestPath = Join-Path $runPath 'Manifest.jsonl'
        $dataPath = Join-Path $runPath 'Data'
        $errors = [Collections.Generic.List[string]]::new()
        $checked = 0

        if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
            $errors.Add('Manifest.jsonl is missing.')
        }
        elseif (-not (Test-Path -LiteralPath $dataPath -PathType Container)) {
            $errors.Add('Data directory is missing.')
        }
        else {
            Get-Content -LiteralPath $manifestPath | ForEach-Object {
                if ([string]::IsNullOrWhiteSpace($_)) { return }
                $entry = $_ | ConvertFrom-Json
                $filePath = Join-Path $dataPath ([string]$entry.pathUtc)
                $checked++

                if (-not (Test-Path -LiteralPath $filePath -PathType Leaf)) {
                    $errors.Add("Missing file: $($entry.pathUtc)")
                    return
                }

                $item = Get-Item -LiteralPath $filePath
                if ($item.Length -ne [int64]$entry.length) {
                    $errors.Add("Length mismatch: $($entry.pathUtc)")
                }

                if ($VerifyHashes -and $entry.sha256) {
                    $hash = (Get-FileHash -LiteralPath $filePath -Algorithm SHA256).Hash
                    if ($hash -ne [string]$entry.sha256) {
                        $errors.Add("Hash mismatch: $($entry.pathUtc)")
                    }
                }
            }
        }

        [pscustomobject]@{
            PSTypeName = 'VolumeManagement.StorageRunValidation'
            Path       = $runPath
            IsValid    = ($errors.Count -eq 0)
            FilesChecked = $checked
            Errors     = $errors.ToArray()
        }
    }
}
