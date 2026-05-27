@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Defrag G Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
set "VolumeType=G"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
call "..\Scripts\CheckSDD.bat %VolumeName%"
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeG.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag G Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo. end of Defrag G Disk Volume
@TIMEOUT /T 1 /NOBREAK >nul
