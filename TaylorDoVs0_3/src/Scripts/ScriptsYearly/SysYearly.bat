@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: SysYearly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoDefragFull.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeSys.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag System Disk Yearly
"DefragSystemDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo . end of SysYearly
@TIMEOUT /T 1 /NOBREAK
