rem TdoListVolumes
@echo off
setlocal EnableExtensions EnableDelayedExpansion

echo =========================================================
echo Available drives on this system
echo =========================================================
echo.

for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (

    if exist "%%D:\" (

        set "DiskType=Unknown"

        for /f "tokens=*" %%T in ('
            fsutil fsinfo sectorinfo %%D: ^| find /I "Trim"
        ') do (
            set "TrimInfo=%%T"
        )

        if /I "!TrimInfo!"=="Trim Supported" (
            set "DiskType=SSD"
        ) else if /I "!TrimInfo!"=="Trim Not Supported" (
            set "DiskType=HDD"
        ) else (
            set "DiskType=Unknown"
        )

        @REM for /f "delims=" %%T in ('
        @REM     powershell -NoProfile -Command ^
        @REM     "$p=Get-Partition -DriveLetter ''%%D''; ^
        @REM     $d=Get-Disk -Number $p.DiskNumber; ^
        @REM     $d.MediaType"
        @REM ') do (
        @REM     set "DiskType=%%T"
        @REM )

        @REM if "!DiskType!"=="" (
        @REM     set "DiskType=Unknown"
        @REM )

        @REM if /I "!DiskType!"=="Unspecified" (
        @REM     set "DiskType=Unknown"
        @REM )

        echo     %%D:  !DiskType!
    )
)

echo.
echo =========================================================
echo.
