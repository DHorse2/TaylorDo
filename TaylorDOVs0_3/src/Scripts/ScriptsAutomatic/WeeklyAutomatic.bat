@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: WeeklyAutomatic Defrag Weekly Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Weekly Disk(s) Automatic
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragSystemDiskWeekly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDevDiskWeekly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDataDiskWeekly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragArchiveDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . end of WeeklyAutomatic Defrag Weekly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
