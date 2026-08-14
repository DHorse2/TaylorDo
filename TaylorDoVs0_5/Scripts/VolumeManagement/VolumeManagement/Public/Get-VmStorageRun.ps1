function Get-VmStorageRun {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $ConfigurationPath,

        [ValidateSet('Daily', 'Weekly', 'Monthly', 'Yearly', 'Archive')]
        [string[]] $RunType,

        [ValidateSet('Complete', 'Failed', 'Copying', 'Verifying')]
        [string[]] $Status
    )

    $configuration = Read-VmConfiguration -Path $ConfigurationPath
    $machine = if ($configuration.MachineName) { $configuration.MachineName } else { $env:COMPUTERNAME }
    $root = Join-Path ([string]$configuration.StoreRoot) (ConvertTo-VmSafeName -Name ([string]$machine))

    $types = if ($RunType) { $RunType } else { @('Daily', 'Weekly', 'Monthly', 'Yearly', 'Archive') }

    foreach ($type in $types) {
        $typeRoot = Join-Path $root $type
        if (-not (Test-Path -LiteralPath $typeRoot)) { continue }

        Get-ChildItem -LiteralPath $typeRoot -Filter 'Run.json' -File -Recurse -Force |
            ForEach-Object {
                $metadata = Get-Content -LiteralPath $_.FullName -Raw | ConvertFrom-Json
                if ($Status -and $metadata.status -notin $Status) { return }

                [pscustomobject]@{
                    PSTypeName = 'VolumeManagement.StorageRun'
                    RunId      = $metadata.runId
                    RunType    = $metadata.runType
                    Name       = $metadata.name
                    Status     = $metadata.status
                    Machine    = $metadata.machine
                    Started    = [datetime]$metadata.started
                    Completed  = if ($metadata.completed) { [datetime]$metadata.completed } else { $null }
                    Path       = Split-Path -Parent $_.FullName
                    Metadata   = $metadata
                }
            }
    }
}
