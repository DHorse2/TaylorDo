function Test-VmVolumeConfiguration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $Path,

        [switch] $PassThru
    )

    $errors = [Collections.Generic.List[string]]::new()

    try {
        $configuration = Read-VmConfiguration -Path $Path
    }
    catch {
        $errors.Add($_.Exception.Message)
        $configuration = $null
    }

    if ($configuration) {
        if (-not $configuration.StoreRoot) {
            $errors.Add('StoreRoot is required.')
        }
        if (-not $configuration.Sources -or @($configuration.Sources).Count -eq 0) {
            $errors.Add('At least one source is required.')
        }
        foreach ($source in @($configuration.Sources)) {
            if (-not $source.Name) { $errors.Add('Every source requires Name.') }
            if (-not $source.Path) { $errors.Add("Source '$($source.Name)' requires Path.") }
            elseif (-not (Test-Path -LiteralPath ([string]$source.Path))) {
                $errors.Add("Source path does not exist: $($source.Path)")
            }
        }
    }

    $result = [pscustomobject]@{
        PSTypeName = 'VolumeManagement.ConfigurationValidation'
        Path       = $Path
        IsValid    = ($errors.Count -eq 0)
        Errors     = $errors.ToArray()
    }

    if ($PassThru) {
        return $result
    }

    if (-not $result.IsValid) {
        $result.Errors | ForEach-Object { Write-Error $_ }
        return $false
    }

    return $true
}
