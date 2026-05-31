@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: All Monthly Defrag All Disk(s) Monthly
@Echo ------------------------------------------------------
cd /d "%~dp0"

set "VolumeType=Sys"
set /p "VolumeName="<"..\..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo  System Disks
    call "SysMonthly.bat"
    cd /d "%~dp0"
)
set "VolumeType=Dev"
set /p "VolumeName="<"..\..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo Dev Disks
    call "DevMonthly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Data"
set /p "VolumeName="<"..\..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. Data Disks
    call "DataMonthly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Archive"
set /p "VolumeName="<"..\..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. !VolumeType! Disks
    call "ArchiveMonthly.bat"
    cd /d "%~dp0"
)
@Echo ------------------------------------------------------
@Echo. end of All Monthly Defrag All Disk(s) Monthly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
pause()
