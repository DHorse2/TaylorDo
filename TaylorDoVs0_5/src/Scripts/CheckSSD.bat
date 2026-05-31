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

if "%~1"=="" (
    echo ERROR: Missing drive letter.
    exit /b 1
)

set "Drive=%~1"

REM =========================================================
REM Normalize Name("C:") format
REM =========================================================

set "Drive=%Drive:Name(=%"
set "Drive=%Drive:)=%"
set "Drive=%Drive:"=%"
set "Drive=%Drive::=%"
set "Drive=%Drive: =%"

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
    exit /b 1
)

REM =========================================================
REM Validate drive exists
REM =========================================================

if not exist "%Drive%:\" (
    echo ERROR: Drive "%Drive%:" does not exist.
    exit /b 1
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
    echo !TrimInfo! | find /I "1" >nul
    if not errorlevel 1 set "DiskType=SSD"
    echo !TrimInfo! | find /I "0" >nul
    if not errorlevel 1 set "DiskType=HDD"
)
echo %Drive%: disk type: %DiskType%
echo.

REM =========================================================
REM SSD Warning / Confirmation
REM =========================================================

if /I "%DiskType%"=="SSD" (

    echo WARNING:
    echo     Drive %Drive%: appears to be an SSD.
    echo     MyDefrag is generally not recommended on SSD drives.
    echo.

    choice /C YN /M "Continue anyway"

    REM -----------------------------------------------------
    REM N = exit with error
    REM -----------------------------------------------------

    if !errorlevel! 2 (
        echo.
        echo Operation cancelled.
        exit /b 1
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