@echo off
setlocal enabledelayedexpansion

:: Config
set "DEPTH=1"
set "colWidth=38"
set "indent=4"

:: init
set /a idx=0
set /a groupCount=0
set "groupFiles0="

:: collect files in root
for /f "delims=" %%F in ('dir /b /a-d /on Do*.bat 2^>nul') do (
  set /a idx+=1
  set "file!idx!=%%~fF"
  set "name!idx!=%%~nF"
  if "!groupFiles0!"=="" (set "groupFiles0=!idx!") else (set "groupFiles0=!groupFiles0!,!idx!")
)

:: collect files in immediate subfolders; store group lists by numeric id
if "%DEPTH%"=="1" (
  for /f "delims=" %%D in ('dir /b /ad /on 2^>nul') do (
    set /a groupCount+=1
    set "groupName[!groupCount!]=%%D"
    set "tmpList="
    for /f "delims=" %%F in ('dir "%%D\*.bat" /b /a-d /on 2^>nul') do (
      set /a idx+=1
      set "file!idx!=%%~fD\%%F"
      set "name!idx!=%%~nF"
      if "!tmpList!"=="" (set "tmpList=!idx!") else (set "tmpList=!tmpList!,!idx!")
    )
    set "groupList[!groupCount!]=!tmpList!"
  )
)

if %idx%==0 (
  echo No .bat files found.
  pause
  exit /b 1
)

echo Available commands:
echo.

call :PrintGroup "Root folder" "%groupFiles0%"

for /l %%G in (1,1,%groupCount%) do (
  set "lst=!groupList[%%G]!"
  if defined lst (
    set "gname=!groupName[%%G]!"
    call :PrintGroup "!gname!" "!lst!"
  )
)

goto :choose

:PrintGroup
@Rem %1 = heading, %2 = comma list
set "heading=%~1"
set "list=%~2"
setlocal EnableDelayedExpansion
if defined list (
  echo %heading%:
  echo.
  set "prev="

  for %%I in (%~2) do (

      @REM echo 1
      call set "txt=[%%I] %%name%%I%%"

      @REM echo 2
      call :Pad "!txt!" "!colWidth!" left

      if not defined prev (
        @REM echo 3
        set "prev=!left!"
      ) else (
        @REM echo 4
        echo !prev!!left!
        set "prev="
      )
  )
  if defined prev echo !prev!
  echo.
)
endlocal
goto :eof

:Pad
setlocal EnableDelayedExpansion

set "s=%~1"
set /a width=%~2

set "spaces=                                                            "
set "s=!s!!spaces!"
set "s=!s:~0,%width%!"

endlocal & set "%~3=%s%"
goto :eof

:choose
set /p sel=Enter number to run (or Q to quit): 
if /i "%sel%"=="Q" exit /b
for /f "delims=0123456789" %%x in ("%sel%") do (
  echo Invalid selection.
  goto choose
)
if "%sel%"=="" goto choose
if %sel% lss 1 goto choose
if %sel% gtr %idx% goto choose

call set "target=%%file%sel%%%"

echo.
echo Running: "%target%"
pause

if not exist "%target%" (
  echo File not found: "%target%"
  pause
  goto choose
)

for %%T in ("%target%") do start "Run %%~nT" cmd /k "%%~fT"
goto :end

:end
endlocal
exit /b
