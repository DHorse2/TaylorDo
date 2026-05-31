@Echo off
setlocal EnableExtensions EnableDelayedExpansion

REM =========================================================
REM CheckSSD.bat
REM =========================================================
REM Usage:
REM     CheckSSD DriveLetter
REM
REM Accepted formats:
REM     C
REM     C:
REM     Name("C:")
REM
REM Examples:
REM     CheckSSD C
REM     CheckSSD D:
REM     CheckSSD Name("E:")
REM
REM Returns:
REM     0 = Safe to continue
REM     1 = SSD detected or invalid drive
REM =========================================================

REM =========================================================
REM Validate parameters
REM =========================================================
@Echo "CheckSSD.bat %~1"
if "%~1"=="" (
    echo ERROR: Missing drive letter.
    exit /b 2
)

REM =========================================================
REM Normalize Name("C:") format
REM =========================================================

@REM set "Drive=%~1"
@REM set "Drive=%Drive:Name(=%"
@REM set "Drive=%Drive:)=%"
@REM @REM set "Drive=%Drive:"=%"
@REM set "Drive=%Drive::=%"
@REM set "Drive=%Drive: =%"

set "Drive=%~1"
echo After ~1: [%Drive%]
set "Drive=%Drive:Name(=%"
echo After Name: [%Drive%]
set "Drive=%Drive:)=%"
echo After paren: [%Drive%]
set "Drive=%Drive:"=%"
echo After quote: [%Drive%]
set "Drive=%Drive::=%"
echo After colon: [%Drive%]
set "Drive=%Drive: =%"
echo After space: [%Drive%]

@Echo Drive=%Drive%
@REM echo(%Drive%| findstr /B /I /C:"Name(" >nul
@REM if not errorlevel 1 (
@REM     set "Drive=%Drive:Name("=%"
@REM     set "Drive=%Drive:")=%"
@REM )

REM =========================================================
REM Normalize drive letter
REM Accept:
REM     C
REM     C:
REM =========================================================

set "Drive=%Drive::=%"

REM =========================================================
REM Validate drive format
REM =========================================================

if not "%Drive:~1,1%"=="" (
    echo ERROR: Invalid drive letter "%~1"
    exit /b 3
)

REM =========================================================
REM Validate drive exists
REM =========================================================

if not exist "%Drive%:\" (
    echo ERROR: Drive "%Drive%:" does not exist.
    exit /b 4
)

REM =========================================================
REM Detect SSD/HDD using Trim support
REM =========================================================

set "TrimInfo="
set "DiskType=Unknown"

for /f "tokens=*" %%T in ('
    fsutil fsinfo sectorinfo %Drive%: ^| find /I "Trim"
') do (
    set "TrimInfo=%%T"
)
if defined TrimInfo (
    echo TrimInfo: !TrimInfo!
    echo !TrimInfo! | find /I "Trim Supported" >nul
    if not errorlevel 1 set "DiskType=SSD"
    echo !TrimInfo! | find /I "Trim Not Supported" >nul
    if not errorlevel 1 set "DiskType=HDD"
)
echo %Drive%: disk type: %DiskType%
echo.
@Echo Drive=%Drive%, Type=%DiskType%

REM =========================================================
REM SSD Warning / Confirmation
REM =========================================================

if /I "%DiskType%"=="SSD" (

    echo WARNING:
    echo     Drive %Drive%: appears to be an SSD.
    echo     MyDefrag is generally not recommended on SSD drives.
    echo.

    choice /C YN /M "Continue anyway"
    set "ChoiceResult=!ERRORLEVEL!"
    REM -----------------------------------------------------
    REM N = exit with error
    REM -----------------------------------------------------

    if "!ChoiceResult!"=="2" (
        echo.
        echo Operation cancelled.
        exit /b 5
    )

    REM -----------------------------------------------------
    REM Y = continue successfully
    REM -----------------------------------------------------

    echo.
    echo Continuing anyway...
    exit /b 0
)

REM =========================================================
REM HDD or Unknown = continue
REM =========================================================

exit /b 0