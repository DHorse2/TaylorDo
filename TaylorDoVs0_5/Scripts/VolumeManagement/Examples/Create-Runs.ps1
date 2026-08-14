$module = Join-Path $PSScriptRoot '..\VolumeManagement\VolumeManagement.psd1'
$config = Join-Path $PSScriptRoot '..\VolumeManagement\Configuration\VolumeManagement.example.psd1'

Import-Module $module -Force

New-VmBackupRun -ConfigurationPath $config -RunType Daily

New-VmArchivePoint `
    -ConfigurationPath $config `
    -Name 'before-abbotsford-sync' `
    -Reason 'Baseline before enabling synchronization'
