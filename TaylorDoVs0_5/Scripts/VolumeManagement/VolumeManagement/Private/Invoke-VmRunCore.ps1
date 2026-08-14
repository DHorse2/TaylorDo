function Invoke-VmRunCore {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [hashtable] $Configuration,

        [Parameter(Mandatory)]
        [ValidateSet('Daily', 'Weekly', 'Monthly', 'Yearly', 'Archive')]
        [string] $RunType,

        [string] $Name,

        [string] $Reason,

        [datetime] $Date = (Get-Date),

        [switch] $Force
    )

    $finalPath = Get-VmRunPath -Configuration $Configuration -RunType $RunType -Date $Date -Name $Name
    $creatingPath = "$finalPath.creating"

    if ((Test-Path -LiteralPath $finalPath) -and -not $Force) {
        throw "A completed run already exists: $finalPath"
    }

    if (Test-Path -LiteralPath $creatingPath) {
        if (-not $Force) {
            throw "An incomplete run already exists: $creatingPath"
        }
        Remove-Item -LiteralPath $creatingPath -Recurse -Force
    }

    if ((Test-Path -LiteralPath $finalPath) -and $Force) {
        Remove-Item -LiteralPath $finalPath -Recurse -Force
    }

    $null = New-Item -ItemType Directory -Path $creatingPath -Force
    $dataRoot = Join-Path $creatingPath 'Data'
    $logRoot = Join-Path $creatingPath 'Logs'
    $null = New-Item -ItemType Directory -Path $dataRoot -Force
    $null = New-Item -ItemType Directory -Path $logRoot -Force

    $runId = [guid]::NewGuid().ToString()
    $started = Get-Date
    $metadata = [ordered]@{
        schemaVersion = 1
        runId         = $runId
        runType       = $RunType
        name          = $Name
        reason        = $Reason
        machine       = if ($Configuration.MachineName) { $Configuration.MachineName } else { $env:COMPUTERNAME }
        started       = $started.ToString('o')
        completed     = $null
        status        = 'Copying'
        sources       = @()
        errors        = @()
    }

    Write-VmJsonFile -InputObject $metadata -Path (Join-Path $creatingPath 'Run.json')

    try {
        foreach ($source in $Configuration.Sources) {
            $sourceName = ConvertTo-VmSafeName -Name ([string]$source.Name)
            $destinationName = if ($source.Destination) {
                ConvertTo-VmSafeName -Name ([string]$source.Destination)
            } else {
                $sourceName
            }

            $destination = Join-Path $dataRoot $destinationName
            $logPath = Join-Path $logRoot "$sourceName.robocopy.log"

            $copyResult = Invoke-VmRobocopy `
                -Source ([string]$source.Path) `
                -Destination $destination `
                -LogPath $logPath `
                -ExcludeDirectories @($source.ExcludeDirectories) `
                -ExcludeFiles @($source.ExcludeFiles) `
                -RetryCount ([int]$Configuration.Copy.RetryCount) `
                -WaitSeconds ([int]$Configuration.Copy.WaitSeconds) `
                -ThreadCount ([int]$Configuration.Copy.ThreadCount)

            $metadata.sources += [ordered]@{
                name        = $sourceName
                source      = [string]$source.Path
                destination = $destinationName
                exitCode    = $copyResult.ExitCode
                result      = $copyResult.Meaning
            }
        }

        $metadata.status = 'Verifying'
        Write-VmJsonFile -InputObject $metadata -Path (Join-Path $creatingPath 'Run.json')

        $hashAlgorithm = if ($Configuration.Verification.HashAlgorithm) {
            [string]$Configuration.Verification.HashAlgorithm
        } else {
            'None'
        }

        $null = New-VmManifest `
            -DataPath $dataRoot `
            -ManifestPath (Join-Path $creatingPath 'Manifest.jsonl') `
            -HashAlgorithm $hashAlgorithm

        $metadata.status = 'Complete'
        $metadata.completed = (Get-Date).ToString('o')
        Write-VmJsonFile -InputObject $metadata -Path (Join-Path $creatingPath 'Run.json')

        $parent = Split-Path -Parent $finalPath
        $null = New-Item -ItemType Directory -Path $parent -Force
        Move-Item -LiteralPath $creatingPath -Destination $finalPath

        return Get-Item -LiteralPath $finalPath
    }
    catch {
        $metadata.status = 'Failed'
        $metadata.errors += $_.Exception.Message
        $metadata.completed = (Get-Date).ToString('o')
        Write-VmJsonFile -InputObject $metadata -Path (Join-Path $creatingPath 'Run.json')
        throw
    }
}
