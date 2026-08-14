function Get-VmVolumeConfiguration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $Path
    )

    return Read-VmConfiguration -Path $Path
}
