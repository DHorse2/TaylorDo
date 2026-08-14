$module = Join-Path $PSScriptRoot '..\VolumeManagement\VolumeManagement.psd1'
$config = Join-Path $PSScriptRoot '..\VolumeManagement\Configuration\VolumeManagement.example.psd1'

Import-Module $module -Force
Test-VmVolumeConfiguration -Path $config -PassThru
Initialize-VmVolumeStore -ConfigurationPath $config
Get-VmStorageCapacity -ConfigurationPath $config
