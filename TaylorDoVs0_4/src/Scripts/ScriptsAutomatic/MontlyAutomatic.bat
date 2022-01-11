@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command:  Monthly Automatic Defrag Monthly Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Monthly Disk(s) Automatic
cd ..
call "..\Commands\DoDefragAutomaticOn.bat"
cd
cd ScriptsMonthly
call "AllMonthly.bat"
@Echo ------------------------------------------------------
@Echo . end of  Monthly Automatic Defrag Monthly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
pause()
