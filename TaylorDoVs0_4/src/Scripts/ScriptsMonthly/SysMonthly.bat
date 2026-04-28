@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Sys Monthly Defrag System Disk Monthly
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
call "..\Commands\DoVolumeSys.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag System Disk Monthly
START /wait "" "DefragSystemDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . end of Sys Monthly Defrag System Disk Monthly
@TIMEOUT /T 1 /NOBREAK
