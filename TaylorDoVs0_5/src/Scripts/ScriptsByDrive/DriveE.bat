@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Defrag E Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
set "VolumeType=E"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
call "..\Scripts\CheckSDD.bat %VolumeName%"
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeE.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag E Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo. end of Defrag E Disk Volume
@TIMEOUT /T 1 /NOBREAK >nul
