@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: SysDaily Defrag System Disk Daily
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
call "..\Commands\DoVolumeSys.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag System Disk Daily
"DefragSystemDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . end of SysDaily Defrag System Disk Daily
@TIMEOUT /T 1 /NOBREAK
