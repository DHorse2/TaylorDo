@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Defrag F Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeF.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag F Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo . end of Defrag F Disk Volume
@TIMEOUT /T 1 /NOBREAK
