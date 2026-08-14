function New-VmArchivePoint {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string] $ConfigurationPath,

        [Parameter(Mandatory)]
        [string] $Name,

        [string] $Reason,

        [datetime] $Date = (Get-Date),

        [switch] $Force
    )

    $configuration = Read-VmConfiguration -Path $ConfigurationPath
    $target = Get-VmRunPath -Configuration $configuration -RunType Archive -Date $Date -Name $Name

    if ($PSCmdlet.ShouldProcess($target, 'Create permanent archive point')) {
        return Invoke-VmRunCore `
            -Configuration $configuration `
            -RunType Archive `
            -Name $Name `
            -Reason $Reason `
            -Date $Date `
            -Force:$Force
    }
}
