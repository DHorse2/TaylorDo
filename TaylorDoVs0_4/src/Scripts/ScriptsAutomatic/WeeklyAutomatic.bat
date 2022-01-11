@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: WeeklyAutomatic Defrag Weekly Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Weekly Disk(s) Automatic
cd ..
call "..\Commands\DoDefragAutomaticOn.bat"
call "\ScriptsWeekly\AllWeekly.bat"
@Echo ------------------------------------------------------
@Echo . end of WeeklyAutomatic Defrag Weekly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
