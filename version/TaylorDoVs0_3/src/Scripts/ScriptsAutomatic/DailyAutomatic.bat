@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DailyAutomatic Defrag Daily Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Daily Disk(s) Automatic
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragSystemDiskDaily.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDevDiskDaily.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDataDiskDaily.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragArchiveDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . end of DailyAutomatic Defrag Daily Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
