@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: ArchiveDaily Defrag Archive Disk Daily
@Echo ------------------------------------------------------
set "VolumeType=Archive"
@Echo.
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I ""=="SKIP" (
    echo.
    @Echo VolumeType !VolumeType! is set as SKIP and is not processed!!!
    echo This volume is SKIPPED!!!
    echo.
    @TIMEOUT /T 1 /NOBREAK >nul
    exit /b 1
)
@TIMEOUT /T 1 /NOBREAK >nul

call "..\..\..\Scripts\CheckSSD.bat" "!VolumeName!"
if %ERRORLEVEL% NEQ 0 (
    echo CheckSSD failed with error: %ERRORLEVEL%
    exit /b %ERRORLEVEL%
)

call "..\..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\..\Commands\DoDefragFast.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\..\Commands\DoVolumeArchive.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Archive Disk Daily
START /wait "" "..\DefragArchiveDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo. end of ArchiveDaily Defrag Archive Disk Daily
@TIMEOUT /T 1 /NOBREAK >nul
