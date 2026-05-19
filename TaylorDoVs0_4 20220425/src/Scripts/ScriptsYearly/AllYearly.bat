@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: AllYearly Defrag All Disk(s) Yearly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo. starting Defrag Yearly Disk(s) 

set "VolumeType=Sys"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
if /I not "%VolName%"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. %VolumeType% Disks
    call "SysYearly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Dev"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
if /I not "%VolName%"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. %VolumeType% Disks
    call "DevYearly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Data"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
if /I not "%VolName%"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. %VolumeType% Disks
    call "DataYearly.bat"
    cd /d "%~dp0"
)

set "VolumeType=Archive"
set /p "VolName="<"..\..\VolumeType\VolumeType%VolumeType%.MyDc"
if /I not "%VolName%"=="SKIP" (
    @Echo ------------------------------------------------------
    @Echo. %VolumeType% Disks
    call "ArchiveYearly.bat"
)
@Echo ------------------------------------------------------
@Echo. end of All Monthly Defrag All Disk(s) Yearly
@TIMEOUT /T 1 /NOBREAK >nul
