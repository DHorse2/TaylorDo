@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: Archive Monthly Defrag Archive Disk Monthly
@Echo ------------------------------------------------------
set "VolumeType=Archive"
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
call "..\Commands\DoVolumeArchive.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Archive Disk Monthly
START /wait "" "DefragArchiveDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo. end of Archive Monthly Defrag Archive Disk Monthly
@TIMEOUT /T 1 /NOBREAK >nul
