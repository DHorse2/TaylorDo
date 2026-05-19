@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: SysWeekly Defrag System Disk Weekly
@Echo ------------------------------------------------------
set "VolumeType=Sys"
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
call "..\Commands\DoVolumeSys.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag System Disk Weekly
START /wait "" "DefragSystemDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo. end of SysWeekly Defrag System Disk Weekly
@TIMEOUT /T 1 /NOBREAK >nul
