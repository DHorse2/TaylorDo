function Remove-VmExpiredStorageRun {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory)]
        [string] $ConfigurationPath,

        [datetime] $AsOf = (Get-Date)
    )

    $configuration = Read-VmConfiguration -Path $ConfigurationPath
    $runs = Get-VmStorageRun -ConfigurationPath $ConfigurationPath -Status Complete

    foreach ($run in $runs) {
        if ($run.RunType -eq 'Archive') { continue }

        $keep = [int]$configuration.Retention.($run.RunType)
        if ($keep -eq 0) { continue }

        $age = switch ($run.RunType) {
            'Daily'   { ($AsOf.Date - $run.Started.Date).TotalDays }
            'Weekly'  { ($AsOf.Date - $run.Started.Date).TotalDays / 7 }
            'Monthly' { (($AsOf.Year - $run.Started.Year) * 12) + ($AsOf.Month - $run.Started.Month) }
            'Yearly'  { $AsOf.Year - $run.Started.Year }
        }

        if ($age -ge $keep) {
            if ($PSCmdlet.ShouldProcess($run.Path, "Remove expired $($run.RunType) storage run")) {
                Remove-Item -LiteralPath $run.Path -Recurse -Force
                $run
            }
        }
    }
}
