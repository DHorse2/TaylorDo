@Echo off
@Echo - Command: DefragDevDiskYearly
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
@Echo starting Defrag Archive Disk Yearly
"DefragArchiveDiskYearly.MyD"
