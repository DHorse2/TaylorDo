function Get-VmRunPath {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [hashtable] $Configuration,

        [Parameter(Mandatory)]
        [ValidateSet('Daily', 'Weekly', 'Monthly', 'Yearly', 'Archive')]
        [string] $RunType,

        [Parameter(Mandatory)]
        [datetime] $Date,

        [string] $Name
    )

    $machine = if ($Configuration.MachineName) {
        [string]$Configuration.MachineName
    } else {
        $env:COMPUTERNAME
    }

    $machine = ConvertTo-VmSafeName -Name $machine
    $base = Join-Path ([string]$Configuration.StoreRoot) $machine

    switch ($RunType) {
        'Daily' {
            return Join-Path $base ('Daily\{0:yyyy}\{0:yyyy-MM}\{0:yyyy-MM-dd}' -f $Date)
        }
        'Weekly' {
            $calendar = [Globalization.CultureInfo]::InvariantCulture.Calendar
            $week = $calendar.GetWeekOfYear(
                $Date,
                [Globalization.CalendarWeekRule]::FirstFourDayWeek,
                [DayOfWeek]::Monday
            )
            return Join-Path $base ('Weekly\{0:yyyy}\{0:yyyy}-W{1:00}' -f $Date, $week)
        }
        'Monthly' {
            return Join-Path $base ('Monthly\{0:yyyy}\{0:yyyy-MM}' -f $Date)
        }
        'Yearly' {
            return Join-Path $base ('Yearly\{0:yyyy}' -f $Date)
        }
        'Archive' {
            if ([string]::IsNullOrWhiteSpace($Name)) {
                throw 'Archive runs require -Name.'
            }
            $safeName = ConvertTo-VmSafeName -Name $Name
            return Join-Path $base ('Archive\{0:yyyy}\{0:yyyy-MM-dd}-{1}' -f $Date, $safeName)
        }
    }
}
