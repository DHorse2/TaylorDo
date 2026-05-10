@echo off
setlocal

REM Check if MyDefrag is already running
tasklist /FI "IMAGENAME eq MyDefrag.exe" | find /I "MyDefrag.exe" >nul

if not errorlevel 1 (
    echo MyDefrag is already running.
    exit /b 1
)

REM Not running
exit /b 0
