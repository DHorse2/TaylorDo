@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Defrag C Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
set "VolumeType=C"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
call "..\Scripts\CheckSDD.bat %VolumeName%"
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeC.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag C Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo. end of Defrag C Disk Volume
@TIMEOUT /T 1 /NOBREAK >nul
