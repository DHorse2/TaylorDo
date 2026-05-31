@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM =========================================================
REM SetVolume.bat
REM =========================================================

REM =========================================================
REM Base directory for all VolumeType files
REM =========================================================

@REM for %%A in ("%~dp0..\..") do set "AppRoot=%%~fA"
@REM echo Root %AppRoot%
@REM cd /d "%~dp0"
set "VolumeDir=%~dp0VolumeType"

if not exist "%VolumeDir%" (
    echo Can't find VolumeType directory:
    echo %VolumeDir%
    echo Run this script from the MyDefrag programs folder. Exiting...
    exit /b 1
    @REM mkdir "%VolumeDir%"
)

REM =========================================================
REM Valid Volume Types
REM =========================================================

set "ValidVolumeTypes=Archive Data Dev Sys"

REM ----- No parameters -----
if "%~1"=="" goto :ShowHelp
if "%~2"=="" goto :ShowHelp

set "VolumeType=%~1"
set "Drive=%~2"

REM =========================================================
REM Validate VolumeType
REM =========================================================

set "VolumeTypeValid="

for %%A in (%ValidVolumeTypes%) do (
    if /I "!VolumeType!"=="%%A" (
        set "VolumeTypeValid=1"
        set "VolumeType=%%A"
    )
)

if not defined VolumeTypeValid (
    echo ERROR: Invalid VolumeType "!VolumeType!"
    echo.
    goto :ShowHelp
)

REM =========================================================
REM Create output filename (NOW IN DIRECTORY)
REM =========================================================

set "OutputFile=%VolumeDir%\VolumeType!VolumeType!.MyDc"

REM =========================================================
REM Special option: SKIP
REM =========================================================

if /I "%Drive%"=="SKIP" (
    <nul set /p "=SKIP" > "%OutputFile%"

    echo Created:
    echo     %OutputFile%
    echo.
    echo Contents:
    type "%OutputFile%"

    exit /b 0
)

REM =========================================================
REM Normalize drive letter
REM =========================================================

set "Drive=%Drive::=%"

if not "%Drive:~1,1%"=="" (
    echo ERROR: Invalid drive letter "%~2"
    echo.
    goto :ShowHelp
)

REM =========================================================
REM Validate drive exists
REM =========================================================

if not exist "%Drive%:\" (
    echo ERROR: Drive "%Drive%:" does not exist.
    echo.
    goto :ShowHelp
)

for /f "tokens=*" %%T in ('
    fsutil fsinfo sectorinfo %Drive%: ^| find /I "Trim"
') do (
    set "TrimInfo=%%T"
)

if /I "!TrimInfo!"=="Trim Supported" (
    set "DiskType=SSD"

    echo.
    echo WARNING: Drive %Drive%: appears to be an SSD.
    echo MyDefrag is generally not recommended on SSD drives.
    echo.

    choice /C YN /M "Continue anyway"
    if errorlevel 2 (
        echo Skipping %%D:
        echo !VolumeType! was not set.
        echo.
        @REM set "DiskType=SKIPPED"
        exit /b 1
    )

) else if /I "!TrimInfo!"=="Trim Not Supported" (
    set "DiskType=HDD"
) else (
    set "DiskType=Unknown"
)
echo %%D: disk type: %DiskType%
echo.

REM =========================================================
REM Write file (NOW IN DIRECTORY)
REM =========================================================

<nul set /p ="Name(%Drive%:)" > "%OutputFile%"

echo Created:
echo     %OutputFile%
echo.
echo Action:
type "%OutputFile%"
echo.
rem Successful end of script where volume type is set to a drive letter.
exit /b 0

REM =========================================================
REM Help
REM =========================================================

:ShowHelp
echo Usage:
echo     SetVolume VolumeType DriveLetter
echo.

echo VolumeType values:
for %%A in (%ValidVolumeTypes%) do (
    echo     %%A
)

echo.
echo DriveLetter values (valid drives only):
echo     C
echo     D:
echo     E
echo     SKIP

echo.
echo Examples:
echo     SetVolume Archive D
echo     SetVolume Dev E:
echo     SetVolume Sys SKIP

echo.
echo =========================================================
echo Available drives on this system
echo =========================================================
echo. Note: TaylorDo skips SSD and network drives.
@REM Limitations:
@REM cannot detect SSD vs HDD
@REM excludes network drives automatically
@REM assumes “Fixed” = OK

for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\" (
        fsutil fsinfo drivetype %%D: 2>nul | find "Fixed" >nul
        if not errorlevel 1 (
            echo     %%D:
        )
    )
)

echo.
echo =========================================================
echo Current Volume Type settings
echo =========================================================
echo.
echo When DriveLetter is set, it will read "Name(DriveLetter:)"
echo Otherwise "SKIP" will indicate the volume isn't processed.
echo.

for %%A in (%ValidVolumeTypes%) do (

    set "FileName=%VolumeDir%\VolumeType%%A.MyDc"

    echo ----- !FileName! -----

    if exist "!FileName!" (
        type "!FileName!"
    ) else (
        echo File not found
    )

    echo.
)

exit /b 1

@REM Notes:
@REM Windows lacks a clean way to detect SDD drives.
@REM These should not be defragmented. A warning is issued.
@REM MyDefrag also has no way to detect them and TaylorDo must be
@REM configured in advance to avoid this problem
@REM MyDefrag Script snippet:
@REM VolumeSelect
@REM (
@REM   include VolumeTypeSelect
@REM )
@REM and Writable(yes)
@REM and Mounted(yes)
@REM and Remote(no)

@REM Equivalent meaning in Windows terms:

@REM MyDefrag rule	Batch/Windows equivalent
@REM Writable(yes)	drive is not read-only
@REM Mounted(yes)	drive exists (X:)
@REM Remote(no)	not network drive
@REM.