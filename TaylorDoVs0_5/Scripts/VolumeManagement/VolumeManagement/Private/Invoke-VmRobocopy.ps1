function Invoke-VmRobocopy {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $Source,

        [Parameter(Mandatory)]
        [string] $Destination,

        [Parameter(Mandatory)]
        [string] $LogPath,

        [string[]] $ExcludeDirectories = @(),

        [string[]] $ExcludeFiles = @(),

        [int] $RetryCount = 3,

        [int] $WaitSeconds = 5,

        [int] $ThreadCount = 8,

        [switch] $Mirror
    )

    if (-not (Get-Command robocopy.exe -ErrorAction SilentlyContinue)) {
        throw 'robocopy.exe is not available.'
    }

    $null = New-Item -ItemType Directory -Path $Destination -Force
    $null = New-Item -ItemType Directory -Path (Split-Path -Parent $LogPath) -Force

    $arguments = @(
        $Source,
        $Destination,
        $(if ($Mirror) { '/MIR' } else { '/E' }),
        '/COPY:DAT',
        '/DCOPY:DAT',
        '/Z',
        "/R:$RetryCount",
        "/W:$WaitSeconds",
        '/XJ',
        "/MT:$ThreadCount",
        '/NP',
        '/TEE',
        "/LOG:$LogPath"
    )

    if ($ExcludeDirectories.Count -gt 0) {
        $arguments += '/XD'
        $arguments += $ExcludeDirectories
    }

    if ($ExcludeFiles.Count -gt 0) {
        $arguments += '/XF'
        $arguments += $ExcludeFiles
    }

    & robocopy.exe @arguments
    $result = Get-VmRobocopyExitMeaning -ExitCode $LASTEXITCODE

    if (-not $result.Succeeded) {
        throw "Robocopy failed with exit code $($result.ExitCode): $($result.Meaning)"
    }

    return $result
}
