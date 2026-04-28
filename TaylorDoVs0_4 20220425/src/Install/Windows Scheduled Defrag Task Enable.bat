@echo off
setlocal

echo ==========================================
echo Windows Scheduled Defrag Task Enable
echo ==========================================

REM Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script must be run as Administrator.
    exit /b 1
)

REM Enable the scheduled task
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Enable

if %errorlevel% equ 0 (
    echo SUCCESS: Scheduled Defrag task Enabled.
) else (
    echo WARNING: Could not Enable task.
    echo It may already be Enabled or not present.
)

exit /b 0
