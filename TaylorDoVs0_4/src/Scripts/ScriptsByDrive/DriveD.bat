@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Defrag D Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeD.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag D Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo . end of Defrag D Disk Volume
@TIMEOUT /T 1 /NOBREAK
