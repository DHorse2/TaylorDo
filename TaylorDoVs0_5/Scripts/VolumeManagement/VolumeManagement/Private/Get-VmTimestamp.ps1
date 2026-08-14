function Get-VmTimestamp {
    [CmdletBinding()]
    param()

    return (Get-Date).ToString('yyyy-MM-ddTHH-mm-ss.fffK')
}
