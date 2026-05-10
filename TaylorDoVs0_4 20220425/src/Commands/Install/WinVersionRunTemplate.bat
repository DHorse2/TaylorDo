@echo off
setlocal

for /f "tokens=4-5 delims=. " %%i in ('ver') do (
    set major=%%i
    set minor=%%j
)

echo Detected Version: %major%.%minor%

REM Windows 8 / 8.1 = 6.2 / 6.3
if "%major%.%minor%"=="6.2" goto win8
if "%major%.%minor%"=="6.3" goto win81

REM Windows 10 & 11 both report 10.0
if "%major%"=="10" goto win10plus

goto unknown

:win8
echo Running Windows 8 logic...
REM your commands here
goto end

:win81
echo Running Windows 8.1 logic...
REM your commands here
goto end

:win10plus
REM Need to distinguish 10 vs 11 via build number
for /f "tokens=3" %%b in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild ^| find "CurrentBuild"') do set build=%%b

echo Build number: %build%

REM Windows 11 starts at build 22000
if %build% GEQ 22000 goto win11
goto win10

:win10
echo Running Windows 10 logic...
REM your commands here
goto end

:win11
echo Running Windows 11 logic...
REM your commands here
goto end

:unknown
echo Unsupported or unknown Windows version.

:end
endlocal
