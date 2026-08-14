# Pester 5 tests. Tests avoid performing a real Robocopy backup.

BeforeAll {
    $modulePath = Join-Path $PSScriptRoot '..\VolumeManagement\VolumeManagement.psd1'
    Import-Module $modulePath -Force
}

Describe 'VolumeManagement module' {
    It 'imports successfully' {
        Get-Module VolumeManagement | Should -Not -BeNullOrEmpty
    }

    It 'exports the expected public commands' {
        $expected = @(
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

        foreach ($name in $expected) {
            Get-Command $name -Module VolumeManagement |
                Should -Not -BeNullOrEmpty
        }
    }

    It 'uses approved PowerShell verbs' {
        $commands = Get-Command -Module VolumeManagement
        $approved = (Get-Verb).Verb
        foreach ($command in $commands) {
            $verb = ($command.Name -split '-', 2)[0]
            $approved | Should -Contain $verb
        }
    }

    It 'exports a dependency-free MCP capability description' {
        $path = Join-Path $TestDrive 'capability.json'
        Export-VmMcpCapability -Path $path | Should -Not -BeNullOrEmpty
        $capability = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
        $capability.mcpRequired | Should -BeFalse
        $capability.capabilityId | Should -Be 'volume-management'
    }
}
