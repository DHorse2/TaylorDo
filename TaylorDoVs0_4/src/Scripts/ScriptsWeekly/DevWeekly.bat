@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DevWeekly Defrag Dev Disk Weekly
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
call "..\Commands\DoVolumeDev.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Dev Disk Weekly
START /wait "" "DefragDevDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . end of DevWeekly Defrag Dev Disk Weekly
@TIMEOUT /T 1 /NOBREAK
