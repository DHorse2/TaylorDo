@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DevDaily Defrag Dev Disk Daily
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
call "..\Commands\DoVolumeDev.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Dev Disk Daily
START /wait "" "DefragDevDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . end of DevDaily Defrag Dev Disk Daily
@TIMEOUT /T 1 /NOBREAK
