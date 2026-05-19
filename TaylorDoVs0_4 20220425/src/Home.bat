@REM Home
@Rem Displays a menu of commands the user can run
@echo off
setlocal enabledelayedexpansion

rem ------------------------------------------------------
:: Config
if "%~1"=="" (
    set "FileMask=*.bat"
) else (
    set "FileMask=%~1"
)
@REM for %%A in ("%FileMask%") do set "TargetExt=%%~xA"

@REM echo Pattern: %~1
@REM echo FileMask: !FileMask!
set "colWidth=38"
set "indent=4"
:: init
set /a idx=0
set /a groupCount=0
set "root=%CD%\"

rem ------------------------------------------------------
:: collect all matching files recursively
for /r %%F in (%FileMask%) do (
  @REM echo File: %%F
  @REM echo Extension: %%~xF

  set /a idx+=1
  set "file!idx!=%%~fF"
  set "name!idx!=%%~nF"

  rem relative folder from script root
  set "rel=%%~dpF"
  set "rel=!rel:%root%=!"
  rem remove trailing slash
  if "!rel:~-1!"=="\" set "rel=!rel:~0,-1!"

  rem root folder label
  if "!rel!"=="" set "rel=Root folder"

  rem locate/create group
  set "found="

  for /l %%G in (1,1,!groupCount!) do (
      if /i "!groupName[%%G]!"=="!rel!" (
          set "found=%%G"
      )
  )

  if not defined found (
      set /a groupCount+=1
      set "found=!groupCount!"
      set "groupName[!found!]=!rel!"
  )

  call set "tmp=%%groupList[!found!]%%"

  if defined tmp (
      set "groupList[!found!]=!tmp!,!idx!"
  ) else (
      set "groupList[!found!]=!idx!"
  )
)

if !idx! EQU 0 (
  echo No !FileMask! files found.
  pause
  exit /b 1
)

rem ------------------------------------------------------
echo Available commands:
echo.

for /l %%G in (1,1,%groupCount%) do (  
  set "lst=!groupList[%%G]!"
  if defined lst (
    set "gname=!groupName[%%G]!"
    call :PrintGroup "!gname!" "!lst!"
  )
)

goto :choose

rem ------------------------------------------------------
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

rem ------------------------------------------------------
:choose
set /p sel=Enter number to run (or Q to quit): 
if /i "%sel%"=="Q" exit /b
for /f "delims=0123456789" %%x in ("%sel%") do (
  echo Invalid selection.
  goto choose
)
if "%sel%"=="" goto choose
if %sel% lss 1 goto choose
if %sel% gtr !idx! goto choose

echo "target=%%file%sel%%%"
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
