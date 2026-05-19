@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Defrag F Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
set "VolumeType=F"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
call "..\Scripts\CheckSDD.bat %VolumeName%"
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeF.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag F Disk Volume
"DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo. end of Defrag F Disk Volume
@TIMEOUT /T 1 /NOBREAK >nul
