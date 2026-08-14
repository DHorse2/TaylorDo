$module = Join-Path $PSScriptRoot '..\VolumeManagement\VolumeManagement.psd1'
$config = Join-Path $PSScriptRoot '..\VolumeManagement\Configuration\VolumeManagement.example.psd1'

Import-Module $module -Force

$run = Get-VmStorageRun -ConfigurationPath $config -Status Complete |
    Sort-Object Completed -Descending |
    Select-Object -First 1

$run | Test-VmStorageRun -VerifyHashes

$plan = New-VmRestorePlan `
    -RunPath $run.Path `
    -DestinationPath 'D:\Restore-Test'

$plan

# Execute only after reviewing the plan:
# $plan | Restore-VmStorageRun -WhatIf
