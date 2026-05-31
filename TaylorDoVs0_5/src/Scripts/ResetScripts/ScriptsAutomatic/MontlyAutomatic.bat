@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command:  Monthly Automatic Defrag Monthly Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Monthly Disk(s) Automatic
call "..\..\Commands\DoDefragAutomaticOn.bat"
call "..\ScriptsMonthly\AllMonthly.bat"
@Echo ------------------------------------------------------
@Echo. end of  Monthly Automatic Defrag Monthly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK >nul
pause()
