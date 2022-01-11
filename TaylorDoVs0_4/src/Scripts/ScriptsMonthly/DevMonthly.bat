@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Dev Monthly Defrag Dev Disk Monthly
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
@Echo . starting Defrag Dev Disk Monthly
START /wait "" "DefragDevDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . end of Dev Monthly Defrag Dev Disk Monthly
@TIMEOUT /T 1 /NOBREAK
