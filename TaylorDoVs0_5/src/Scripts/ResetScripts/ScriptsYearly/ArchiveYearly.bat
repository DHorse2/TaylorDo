@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: ArchiveYearly
@Echo ------------------------------------------------------
set "VolumeType=Archive"
@Echo.
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I "!VolumeName!"=="SKIP" (
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

call "..\..\Commands\DoDefragFull.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------

call "..\..\Commands\DoVolumeArchive.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Archive Disk Yearly

START /wait "" "..\DefragArchiveDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo. end of ArchiveYearly
@TIMEOUT /T 1 /NOBREAK >nul
