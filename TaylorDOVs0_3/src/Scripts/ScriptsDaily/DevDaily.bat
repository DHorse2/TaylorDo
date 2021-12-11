@Echo off
@Echo - Command: Defrag Dev Disk Daily
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
@Echo starting Defrag Dev Disk Daily
"DefragDevDiskDaily.MyD"
