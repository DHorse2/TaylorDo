@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Defrag G Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeG.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag G Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo . end of Defrag G Disk Volume
@TIMEOUT /T 1 /NOBREAK
