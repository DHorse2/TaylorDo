@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DevDaily Defrag Dev Disk Daily
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

call "..\Scripts\CheckSDD.bat %VolumeName%"
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoDefragFast.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeDev.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Dev Disk Daily
START /wait "" "DefragDevDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo. end of DevDaily Defrag Dev Disk Daily
@TIMEOUT /T 1 /NOBREAK >nul
