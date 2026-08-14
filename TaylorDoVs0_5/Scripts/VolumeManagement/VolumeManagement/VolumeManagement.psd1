@{
    RootModule        = 'VolumeManagement.psm1'
    ModuleVersion     = '0.1.0'
    GUID              = '55432d0f-7c80-45bb-8358-b34ab4fd095f'
    Author            = 'Volume Management Project'
    CompanyName       = ''
    Copyright         = 'Provided as part of the Volume Management library.'
    Description       = 'Standalone-first, MCP-enabled Windows volume, backup, archive, verification, retention, and restore management.'
    PowerShellVersion = '5.1'

    FunctionsToExport = @(
        'Get-VmVolume',
        'Get-VmVolumeConfiguration',
        'Test-VmVolumeConfiguration',
        'Initialize-VmVolumeStore',
        'New-VmBackupRun',
        'New-VmArchivePoint',
        'Get-VmStorageRun',
        'Test-VmStorageRun',
        'Remove-VmExpiredStorageRun',
        'New-VmRestorePlan',
        'Restore-VmStorageRun',
        'Get-VmStorageCapacity',
        'Export-VmMcpCapability'
    )

    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()

    PrivateData = @{
        PSData = @{
            Tags       = @('Volume Management', 'Backup', 'Archive', 'Volume', 'Storage', 'MCP')
            ProjectUri = ''
        }
    }
}
