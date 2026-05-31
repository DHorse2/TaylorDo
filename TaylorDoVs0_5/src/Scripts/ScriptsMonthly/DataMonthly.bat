@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Data Monthly Defrag Data Disk Monthly
@Echo ------------------------------------------------------
set "VolumeType=Data"
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
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoDefragRegular.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeData.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Data Disk Monthly
START /wait "" "DefragDataDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo. end of Data Monthly Defrag Data Disk Monthly
@TIMEOUT /T 1 /NOBREAK >nul
