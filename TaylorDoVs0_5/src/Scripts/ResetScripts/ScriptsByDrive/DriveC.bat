@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Defrag C Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
set "VolumeType=C"
@Echo.
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
call "..\..\..\Scripts\CheckSSD.bat" "!VolumeName!"

call "..\..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\..\Commands\DoVolumeC.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag C Disk Volume
START /wait "" "..\DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo. end of Defrag C Disk Volume
@TIMEOUT /T 1 /NOBREAK >nul
