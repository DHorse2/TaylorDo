function Restore-VmStorageRun {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string] $RunPath,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string] $DestinationPath,

        [switch] $Overwrite,

        [int] $RetryCount = 3,

        [int] $WaitSeconds = 5,

        [int] $ThreadCount = 8
    )

    process {
        $dataPath = Join-Path (Resolve-Path -LiteralPath $RunPath).Path 'Data'
        $logPath = Join-Path (Resolve-Path -LiteralPath $RunPath).Path ('Logs\restore-{0}.log' -f (Get-VmTimestamp))

        if ($PSCmdlet.ShouldProcess($DestinationPath, "Restore from $dataPath")) {
            $arguments = @(
                $dataPath,
                $DestinationPath,
                '/E',
                '/COPY:DAT',
                '/DCOPY:DAT',
                '/Z',
                "/R:$RetryCount",
                "/W:$WaitSeconds",
                '/XJ',
                "/MT:$ThreadCount",
                '/NP',
                '/TEE',
                "/LOG:$logPath"
            )

            if (-not $Overwrite) {
                $arguments += @('/XC', '/XN', '/XO')
            }

            & robocopy.exe @arguments
            $result = Get-VmRobocopyExitMeaning -ExitCode $LASTEXITCODE
            if (-not $result.Succeeded) {
                throw "Restore failed with exit code $($result.ExitCode): $($result.Meaning)"
            }

            return $result
        }
    }
}
