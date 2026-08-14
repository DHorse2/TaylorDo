@echo off
setlocal EnableExtensions

if "%~1"=="" (
    echo Usage: Volume ManagementBackup.cmd Daily^|Weekly^|Monthly^|Yearly [ConfigurationPath]
    exit /b 64
)

set "RUN_TYPE=%~1"
set "CONFIG=%~2"

if not defined CONFIG (
    set "CONFIG=%~dp0..\VolumeManagement\Configuration\VolumeManagement.example.psd1"
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass ^
  -Command "Import-Module '%~dp0..\VolumeManagement\VolumeManagement.psd1' -Force; New-VmBackupRun -ConfigurationPath '%CONFIG%' -RunType '%RUN_TYPE%'"

exit /b %ERRORLEVEL%
