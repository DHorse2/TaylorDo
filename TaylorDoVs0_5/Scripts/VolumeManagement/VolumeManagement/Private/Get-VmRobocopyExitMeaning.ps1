function Get-VmRobocopyExitMeaning {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int] $ExitCode
    )

    [pscustomobject]@{
        ExitCode  = $ExitCode
        Succeeded = ($ExitCode -lt 8)
        Meaning   = switch ($ExitCode) {
            0 { 'No files copied; source and destination already matched.' }
            1 { 'Files copied successfully.' }
            2 { 'Extra destination files or directories detected.' }
            3 { 'Files copied and extra destination entries detected.' }
            4 { 'Mismatched files or directories detected.' }
            5 { 'Files copied and mismatches detected.' }
            6 { 'Extra and mismatched entries detected.' }
            7 { 'Files copied with extra and mismatched entries detected.' }
            default {
                if ($ExitCode -ge 8) { 'At least one copy failure occurred.' }
                else { 'Unrecognized Robocopy result.' }
            }
        }
    }
}
