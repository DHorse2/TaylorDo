@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Defrag C Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeC.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag C Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo . end of Defrag C Disk Volume
@TIMEOUT /T 1 /NOBREAK
