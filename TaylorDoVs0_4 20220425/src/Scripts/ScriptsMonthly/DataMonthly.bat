@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Data Monthly Defrag Data Disk Monthly
@Echo ------------------------------------------------------
set "VolumeType=Data"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
if /I "%VolName%"=="SKIP" (
    echo.
    @Echo VolumeType %VolumeType% is set as SKIP and is not processed!!!
    echo This volume is SKIPPED!!!
    echo.
    @TIMEOUT /T 1 /NOBREAK >nul
    exit /b 1
)
@TIMEOUT /T 1 /NOBREAK >nul

call "..\Scripts\CheckSDD.bat %VolumeName%"
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
