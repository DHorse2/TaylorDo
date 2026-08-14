function Export-VmMcpCapability {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $Path
    )

    $capability = [ordered]@{
        schemaVersion = 1
        capabilityId  = 'volume-management'
        displayName   = 'Volume Management'
        operatingMode = 'standalone-first'
        mcpRequired   = $false
        transport     = 'none'
        commands      = @(
            @{ name = 'volume.list';            powershell = 'Get-VmVolume' },
            @{ name = 'backup.create';          powershell = 'New-VmBackupRun' },
            @{ name = 'archive.create';         powershell = 'New-VmArchivePoint' },
            @{ name = 'storage-run.list';       powershell = 'Get-VmStorageRun' },
            @{ name = 'storage-run.verify';     powershell = 'Test-VmStorageRun' },
            @{ name = 'storage-run.expire';     powershell = 'Remove-VmExpiredStorageRun' },
            @{ name = 'restore.plan';           powershell = 'New-VmRestorePlan' },
            @{ name = 'restore.execute';        powershell = 'Restore-VmStorageRun' },
            @{ name = 'capacity.get';           powershell = 'Get-VmStorageCapacity' }
        )
        notes = @(
            'This file describes an optional MCP adapter boundary.',
            'The module has no MCP runtime dependency.',
            'A future adapter may translate MCP requests into these public commands.'
        )
    }

    Write-VmJsonFile -InputObject $capability -Path $Path
    return Get-Item -LiteralPath $Path
}
