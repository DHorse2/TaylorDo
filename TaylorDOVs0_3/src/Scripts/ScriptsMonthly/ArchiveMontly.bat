@Echo off
@Echo - Command: Defrag Archive Disk Monthly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoDefragRegular.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo starting Defrag Archive Disk Monthly
"DefragArchiveDiskMonthly.MyD"
