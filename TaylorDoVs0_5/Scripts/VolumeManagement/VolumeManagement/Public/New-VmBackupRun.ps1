function New-VmBackupRun {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string] $ConfigurationPath,

        [Parameter(Mandatory)]
        [ValidateSet('Daily', 'Weekly', 'Monthly', 'Yearly')]
        [string] $RunType,

        [datetime] $Date = (Get-Date),

        [switch] $Force
    )

    $configuration = Read-VmConfiguration -Path $ConfigurationPath
    $target = Get-VmRunPath -Configuration $configuration -RunType $RunType -Date $Date

    if ($PSCmdlet.ShouldProcess($target, "Create $RunType backup run")) {
        return Invoke-VmRunCore `
            -Configuration $configuration `
            -RunType $RunType `
            -Date $Date `
            -Force:$Force
    }
}
