function New-VmRestorePlan {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $RunPath,

        [Parameter(Mandatory)]
        [string] $DestinationPath,

        [switch] $Overwrite
    )

    $resolvedRun = (Resolve-Path -LiteralPath $RunPath).Path
    $dataPath = Join-Path $resolvedRun 'Data'

    if (-not (Test-Path -LiteralPath $dataPath -PathType Container)) {
        throw "Run data directory not found: $dataPath"
    }

    [pscustomobject]@{
        PSTypeName      = 'VolumeManagement.RestorePlan'
        RunPath         = $resolvedRun
        SourceDataPath  = $dataPath
        DestinationPath = $DestinationPath
        Overwrite       = [bool]$Overwrite
        Created         = Get-Date
        Command         = 'Restore-VmStorageRun'
    }
}
