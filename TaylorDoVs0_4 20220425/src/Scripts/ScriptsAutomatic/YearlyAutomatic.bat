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
call "\ScriptsYearly\AllYearly.bat"
@REM schtasks /delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once" /f
@Echo ------------------------------------------------------
@Echo . end of YearlyAutomatic Defrag Yearly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
