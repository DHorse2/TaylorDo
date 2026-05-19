@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DevWeekly Defrag Dev Disk Weekly
@Echo ------------------------------------------------------
set "VolumeType=Dev"
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
call "..\Commands\DoVolumeDev.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Dev Disk Weekly
START /wait "" "DefragDevDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo. end of DevWeekly Defrag Dev Disk Weekly
@TIMEOUT /T 1 /NOBREAK >nul
