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
rem %1 = heading, %2 = comma list
setlocal enabledelayedexpansion
set "heading=%~1"
set "list=%~2"
echo %heading%:
if defined list (
  for %%I in (!list!) do (
    set "nm=!name%%I!"
    rem indent
    set "ind="
    for /l %%Z in (1,1,%indent%) do set "ind=!ind! "
    set "left=!ind!!nm!"
    rem truncate
    if defined left if "!left:~%colWidth%!" NEQ "" set "left=!left:~0,%colWidth%!"
    rem pad to width
    @REM echo !ind! ind
    @REM echo !nm! nm
    @REM echo !left! left
    call :Pad rightleft "%left%" %colWidth% padded
    @REM echo !padded!  [%%I]
    echo [%%I] !left!
    @REM pause
      )
) else (
  echo   (no files)
)
echo.
endlocal
goto :eof

:Pad
rem args: dummyName string width outVar
setlocal enabledelayedexpansion
set "s=%~2"
set /a w=%~3
:padloop
set "len=0" & set "tmp=%s%"
:lenloop
if defined tmp ( set "tmp=!tmp:~1!" & set /a len+=1 & goto lenloop )
if %len% GEQ %w% ( set "res=%s:~0,%w%%" ) else (
  set "pad="
  for /l %%p in (1,1,%w%) do set "pad=!pad! "
  set "res=%s%%pad:~0,%w%%%"
)
endlocal & set "%~4=%res%"
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
