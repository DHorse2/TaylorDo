@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Defrag E Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeE.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag E Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo . end of Defrag E Disk Volume
@TIMEOUT /T 1 /NOBREAK
