function Initialize-VmVolumeStore {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string] $ConfigurationPath
    )

    $configuration = Read-VmConfiguration -Path $ConfigurationPath
    $machine = if ($configuration.MachineName) { $configuration.MachineName } else { $env:COMPUTERNAME }
    $root = Join-Path ([string]$configuration.StoreRoot) (ConvertTo-VmSafeName -Name ([string]$machine))

    $paths = @(
        'Daily',
        'Weekly',
        'Monthly',
        'Yearly',
        'Archive',
        'Catalog',
        'Logs',
        'Configuration'
    ) | ForEach-Object { Join-Path $root $_ }

    foreach ($path in $paths) {
        if ($PSCmdlet.ShouldProcess($path, 'Create Volume Management storage directory')) {
            $null = New-Item -ItemType Directory -Path $path -Force
        }
    }

    return Get-Item -LiteralPath $root
}
