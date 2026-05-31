@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Defrag F Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
set "VolumeType=F"
@Echo.
set /p "VolumeName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
call "..\..\Scripts\CheckSSD.bat !VolumenName!"
call "..\..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\..\Commands\DoVolumeF.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag F Disk Volume
START /wait "" "..\DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo. end of Defrag F Disk Volume
@TIMEOUT /T 1 /NOBREAK >nul
