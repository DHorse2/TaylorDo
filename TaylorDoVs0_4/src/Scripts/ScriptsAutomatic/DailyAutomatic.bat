@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DailyAutomatic Defrag Daily Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Daily Disk(s) Automatic
cd ..
call "..\Commands\DoDefragAutomaticOn.bat"
call "\ScriptsDaily\AllDaily.bat"
@Echo ------------------------------------------------------
@Echo . end of DailyAutomatic Defrag Daily Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
