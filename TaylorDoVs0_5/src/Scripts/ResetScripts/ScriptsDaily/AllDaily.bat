@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: AllDaily Defrag All Disk(s) Daily
@Echo ------------------------------------------------------
cd /d "%~dp0"
set /p VolumeName=<'..\..\VolumeType\VolumeTypeSys.txt'
if not "%VolumeName%"=="SKIP"
call "SysDaily.bat"
cd /d "%~dp0"
@Echo ------------------------------------------------------
@Echo. Dev Disks
cd
set /p VolumeName=<'..\..\VolumeType\VolumeTypeDev.txt'
if not "%VolumeName%"=="SKIP"
cd /d "%~dp0"
@cd ScriptsDaily
@Echo ------------------------------------------------------
@Echo. Data Disks
cd
set /p VolumeName=<'..\..\VolumeType\VolumeTypeData.txt'
if not "%VolumeName%"=="SKIP"
call "DataDaily.bat"
cd /d "%~dp0"
@Echo ------------------------------------------------------
@Echo. Archive Disks
cd
set /p VolumeName=<'..\..\VolumeType\VolumeTypeArchive.txt'
if not "%VolumeName%"=="SKIP"
call "ArchiveDaily.bat"
@Echo ------------------------------------------------------
@Echo. end of All Monthly Defrag All Disk(s) Daily
@TIMEOUT /T 1 /NOBREAK >nul
