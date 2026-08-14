function ConvertTo-VmSafeName {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $Name
    )

    $safe = $Name.Trim() -replace '[<>:"/\\|?*\x00-\x1F]', '-'
    $safe = $safe -replace '\s+', '-'
    $safe = $safe.Trim('.-')

    if ([string]::IsNullOrWhiteSpace($safe)) {
        throw 'The supplied name does not contain a usable filename.'
    }

    return $safe
}
