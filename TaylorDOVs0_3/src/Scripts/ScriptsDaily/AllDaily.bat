@Echo off
@Echo - Command: Defrag All Disk(s) Daily
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoDefragFast.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo starting Defrag All Disk(s) Daily
"DefragAllDiskDaily.MyD"
