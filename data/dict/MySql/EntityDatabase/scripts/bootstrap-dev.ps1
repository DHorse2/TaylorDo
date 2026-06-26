#Requires -Version 7.0
# File: bootstrap-dev.ps1
<#
.SYNOPSIS
Bootstraps the local EntityDatabase MySQL schema.

.DESCRIPTION
Runs the database creation script and primary contacts table definition for local
development. This script does not store credentials; pass credentials through the
MySQL client configuration, environment, or interactive prompt.

.PARAMETER MySqlCommand
The MySQL client executable to run.

.PARAMETER HostName
The MySQL host name.

.PARAMETER UserName
The MySQL user name.

.PARAMETER DatabaseName
The database name to create and use.

.EXAMPLE
./bootstrap-dev.ps1 -UserName root
#>
[CmdletBinding()]
param(
    [string] $MySqlCommand = 'mysql',
    [string] $HostName = 'localhost',
    [string] $UserName = 'root',
    [string] $DatabaseName = 'email_contacts'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptRoot = Split-Path -Parent $PSCommandPath
$databaseRoot = Resolve-Path -LiteralPath (Join-Path $scriptRoot '..')
$schemaRoot = Join-Path $databaseRoot 'schema'
$createDatabaseScript = Join-Path $schemaRoot 'Create_Database.sql'
$contactTableScript = Join-Path $schemaRoot 'Create_ContactTable.sql'

# Runs a SQL file through the MySQL command line client.
function Invoke-MySqlScript {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $ScriptPath,

        [string] $TargetDatabase
    )

    if (-not (Test-Path -LiteralPath $ScriptPath -PathType Leaf)) {
        throw "SQL script not found: $ScriptPath"
    }

    $mysqlArguments = @(
        '--host', $HostName,
        '--user', $UserName
    )

    if ($TargetDatabase) {
        $mysqlArguments += $TargetDatabase
    }

    Get-Content -LiteralPath $ScriptPath -Raw | & $MySqlCommand @mysqlArguments

    if ($LASTEXITCODE -ne 0) {
        throw "MySQL failed while running: $ScriptPath"
    }
}

Invoke-MySqlScript -ScriptPath $createDatabaseScript
Invoke-MySqlScript -ScriptPath $contactTableScript -TargetDatabase $DatabaseName

Write-Host "EntityDatabase bootstrap completed for database '$DatabaseName'."
