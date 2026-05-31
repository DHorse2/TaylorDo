@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DataDaily Defrag Data Disk Daily
@Echo ------------------------------------------------------
set "VolumeType=Data"
@Echo.
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I ""=="SKIP" (
    echo.
    echo VolumeType !VolumeType! is set as SKIP and is not processed!!!
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
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoDefragFast.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeData.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Data Disk Daily
START /wait "" "DefragDataDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo. end of DataDaily Defrag Data Disk Daily
@TIMEOUT /T 1 /NOBREAK >nul
