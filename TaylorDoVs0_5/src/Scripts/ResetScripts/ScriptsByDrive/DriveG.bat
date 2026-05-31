@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Defrag G Disk Volume
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
set "VolumeType=G"
@Echo.
set /p "VolumeName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
call "..\..\..\Scripts\CheckSSD.bat !VolumenName!"
call "..\..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\..\Commands\DoVolumeG.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag G Disk Volume
START /wait "" "..\DefragAnyDisk.MyD"
@Echo ------------------------------------------------------
@Echo. end of Defrag G Disk Volume
@TIMEOUT /T 1 /NOBREAK >nul
