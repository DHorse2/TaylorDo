function Get-VmVolume {
    [CmdletBinding()]
    param(
        [string[]] $DriveLetter
    )

    $volumes = if (Get-Command Get-Volume -ErrorAction SilentlyContinue) {
        Get-Volume | Where-Object DriveLetter
    } else {
        Get-CimInstance Win32_LogicalDisk -Filter 'DriveType = 3'
    }

    foreach ($volume in $volumes) {
        $letter = if ($volume.DriveLetter -is [char]) {
            [string]$volume.DriveLetter
        } else {
            ([string]$volume.DeviceID).TrimEnd(':')
        }

        if ($DriveLetter -and $letter -notin ($DriveLetter | ForEach-Object { $_.TrimEnd(':') })) {
            continue
        }

        $size = [int64]$volume.Size
        $free = if ($null -ne $volume.SizeRemaining) {
            [int64]$volume.SizeRemaining
        } else {
            [int64]$volume.FreeSpace
        }

        [pscustomobject]@{
            PSTypeName       = 'VolumeManagement.Volume'
            ComputerName     = $env:COMPUTERNAME
            DriveLetter      = "$letter`:"
            Label            = [string]$volume.FileSystemLabel
            FileSystem       = [string]$volume.FileSystem
            SizeBytes        = $size
            FreeBytes        = $free
            UsedBytes        = $size - $free
            FreePercent      = if ($size -gt 0) { [math]::Round(($free / $size) * 100, 2) } else { 0 }
            HealthStatus     = [string]$volume.HealthStatus
            OperationalStatus = [string]$volume.OperationalStatus
        }
    }
}
