@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: YearlyAutomatic Defrag Yearly Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Yearly Disk(s) Automatic
cd ..
call "..\Commands\DoDefragAutomaticOn.bat"
cd .. ScriptsYearly
call "AllYearly.bat"
@Echo ------------------------------------------------------
@Echo . end of YearlyAutomatic Defrag Yearly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
