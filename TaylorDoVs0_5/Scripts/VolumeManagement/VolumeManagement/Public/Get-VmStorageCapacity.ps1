function Get-VmStorageCapacity {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $ConfigurationPath
    )

    $configuration = Read-VmConfiguration -Path $ConfigurationPath
    $root = [string]$configuration.StoreRoot
    $drive = [IO.Path]::GetPathRoot($root)

    $volume = Get-VmVolume -DriveLetter $drive.TrimEnd('\', ':') | Select-Object -First 1
    $runs = @(Get-VmStorageRun -ConfigurationPath $ConfigurationPath)
    $completed = @($runs | Where-Object Status -eq 'Complete')

    [pscustomobject]@{
        PSTypeName       = 'VolumeManagement.StorageCapacity'
        StoreRoot        = $root
        DriveLetter      = $volume.DriveLetter
        VolumeSizeBytes  = $volume.SizeBytes
        VolumeFreeBytes  = $volume.FreeBytes
        VolumeFreePercent = $volume.FreePercent
        RunCount         = $runs.Count
        CompletedRunCount = $completed.Count
        ArchivePointCount = @($completed | Where-Object RunType -eq 'Archive').Count
    }
}
