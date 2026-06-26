@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: SysWeekly Defrag System Disk Weekly
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
@Echo . starting Defrag System Disk Weekly
START /wait "" "DefragSystemDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . end of SysWeekly Defrag System Disk Weekly
@TIMEOUT /T 1 /NOBREAK
