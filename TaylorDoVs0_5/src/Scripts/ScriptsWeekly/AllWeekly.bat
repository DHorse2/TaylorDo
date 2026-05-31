@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: AllWeekly Defrag All Disk(s) Weekly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
cd /d "%~dp0"

set "VolumeType=Sys"
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo  System Disks
    call "SysWeekly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Dev"
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo Dev Disks
    call "DevWeekly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Data"
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. Data Disks
    call "DataWeekly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Archive"
set /p "VolumeName="<"..\..\VolumeType\VolumeType!VolumeType!.MyDc"
if /I not "!VolumeName!"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. !VolumeType! Disks
    call "ArchiveWeekly.bat"
    cd /d "%~dp0"
)
@Echo ------------------------------------------------------
@Echo. end of All Monthly Defrag All Disk(s) Weekly
@TIMEOUT /T 1 /NOBREAK >nul
