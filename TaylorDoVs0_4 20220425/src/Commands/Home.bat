@echo off
setlocal enabledelayedexpansion

:: Config: how deep to scan (0 = current folder only, 1 = include immediate subfolders)
set "DEPTH=1"
set /a idx=0

:: Build menu list
echo Available commands:
for /f "delims=" %%F in ('dir /b /a-d /on *.bat 2^>nul') do (
  set /a idx+=1
  set "file!idx!=%%~fF"
  echo  !idx!. %%~nF
)
if "%DEPTH%"=="1" (
  for /f "delims=" %%D in ('dir /b /ad /on 2^>nul') do (
    for /f "delims=" %%F in ('dir "%%D\*.bat" /b /a-d /on 2^>nul') do (
      set /a idx+=1
      set "file!idx!=%%~fD\%%F"
      echo  !idx!. %%~nF  (in %%D)
    )
  )
)

if %idx%==0 (
  echo No .bat files found.
  pause
  exit /b 1
)

:choose
set /p sel=Enter number to run (or Q to quit): 
if /i "%sel%"=="Q" exit /b
rem validate numeric selection
for /f "delims=0123456789" %%x in ("%sel%") do (
  echo Invalid selection.
  goto choose
)
if "%sel%"=="" goto choose
if %sel% lss 1 goto choose
if %sel% gtr %idx% goto choose

:: retrieve path (uses CALL to expand the percent-style variable name)
call set "target=%%file%sel%%%"

:: debug / verify
echo Target="%target%"
pause

if not exist "%target%" (
  echo File not found: "%target%"
  pause
  goto choose
)

:: start the target in a new cmd window and keep it open; title is the target name
for %%T in ("%target%") do start "Run %%~nT" cmd /k "%%~fT"

goto end

:end
endlocal
