@echo off
setlocal EnableExtensions

if "%~1"=="" (
    echo Usage: Volume ManagementArchive.cmd "Archive Name" ["Reason"] [ConfigurationPath]
    exit /b 64
)

set "ARCHIVE_NAME=%~1"
set "REASON=%~2"
set "CONFIG=%~3"

if not defined CONFIG (
    set "CONFIG=%~dp0..\VolumeManagement\Configuration\VolumeManagement.example.psd1"
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass ^
  -Command "Import-Module '%~dp0..\VolumeManagement\VolumeManagement.psd1' -Force; New-VmArchivePoint -ConfigurationPath '%CONFIG%' -Name '%ARCHIVE_NAME%' -Reason '%REASON%'"

exit /b %ERRORLEVEL%
