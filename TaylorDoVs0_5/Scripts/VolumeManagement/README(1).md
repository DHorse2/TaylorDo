# Volume Management PowerShell Library

A standalone-first, optionally MCP-enabled PowerShell library for Windows volume inventory, backup, archiving, verification, retention, and restoration.

## Requirements

- Windows
- Windows PowerShell 5.1 or PowerShell 7+
- `robocopy.exe`
- Pester 5 only for running the included tests

## Install for the current user

Copy the `VolumeManagement` module directory into:

```text
%USERPROFILE%\Documents\WindowsPowerShell\Modules\
```

or import it directly:

```powershell
Import-Module .\VolumeManagement\VolumeManagement.psd1 -Force
```

## Configure

Copy and edit:

```text
VolumeManagement\Configuration\VolumeManagement.example.psd1
```

Set:

- `StoreRoot`
- source paths
- exclusions
- verification policy
- retention policy

## Initialize

```powershell
Initialize-VmVolumeStore -ConfigurationPath .\VolumeManagement.psd1
```

## Create backup runs

```powershell
New-VmBackupRun -ConfigurationPath .\VolumeManagement.psd1 -RunType Daily
New-VmBackupRun -ConfigurationPath .\VolumeManagement.psd1 -RunType Weekly
New-VmBackupRun -ConfigurationPath .\VolumeManagement.psd1 -RunType Monthly
New-VmBackupRun -ConfigurationPath .\VolumeManagement.psd1 -RunType Yearly
```

## Create an archive point

```powershell
New-VmArchivePoint `
    -ConfigurationPath .\VolumeManagement.psd1 `
    -Name 'before-abbotsford-sync' `
    -Reason 'Baseline before synchronization'
```

## Inspect and verify

```powershell
Get-VmStorageRun -ConfigurationPath .\VolumeManagement.psd1

Get-VmStorageRun -ConfigurationPath .\VolumeManagement.psd1 -Status Complete |
    Test-VmStorageRun
```

Use `-VerifyHashes` when SHA-256 manifests were enabled.

## Retention

Preview first:

```powershell
Remove-VmExpiredStorageRun `
    -ConfigurationPath .\VolumeManagement.psd1 `
    -WhatIf
```

Archive points are never removed by retention.

## Restore

```powershell
$plan = New-VmRestorePlan `
    -RunPath 'E:\Volume Management\VolumeManagement\MACHINE\Daily\2026\2026-07\2026-07-18' `
    -DestinationPath 'D:\Restore-Test'

$plan | Restore-VmStorageRun -WhatIf
```

## Batch compatibility

The `Batch` directory contains `.cmd` entry points. They launch the PowerShell module but preserve a batch-oriented operational surface for Volume Management scheduling and legacy workflows.

## MCP integration

```powershell
Export-VmMcpCapability -Path .\volume-management.capability.json
```

The descriptor defines a future adapter boundary. MCP is not required to install or use the module.

## Current limits

- Version 0.1 creates complete filesystem copies for each run; it does not yet implement deduplication or hard-link snapshot optimization.
- It does not yet use VSS for open-file snapshots.
- It does not yet integrate link repair, filesystem indexing, synchronization, or Volume Management disk optimization.
- Restore is intentionally conservative.
