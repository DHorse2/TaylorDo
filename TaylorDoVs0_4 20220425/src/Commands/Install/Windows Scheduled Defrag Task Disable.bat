@echo off
setlocal

echo ==========================================
echo Disabling Windows Scheduled Defrag Task
echo ==========================================

REM Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script must be run as Administrator.
    exit /b 1
)

REM Disable the scheduled task
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul 2>&1

if %errorlevel% equ 0 (
    echo SUCCESS: Scheduled Defrag task disabled.
) else (
    echo WARNING: Could not disable task.
    echo It may already be disabled or not present.
)

exit /b 0
