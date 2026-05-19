@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: AllDaily Defrag All Disk(s) Daily
@Echo ------------------------------------------------------
cd /d "%~dp0"
set /p VolName=<'..\..\VolumeType\VolumeTypeSys.MyDc'
if not VolName==SKIP
call "SysDaily.bat"
cd /d "%~dp0"
@Echo ------------------------------------------------------
@Echo. Dev Disks
cd
set /p VolName=<'..\..\VolumeType\VolumeTypeDev.MyDc'
if not VolName==SKIP
cd /d "%~dp0"
@cd ScriptsDaily
@Echo ------------------------------------------------------
@Echo. Data Disks
cd
set /p VolName=<'..\..\VolumeType\VolumeTypeData.MyDc'
if not VolName==SKIP
call "DataDaily.bat"
cd /d "%~dp0"
@Echo ------------------------------------------------------
@Echo. Archive Disks
cd
set /p VolName=<'..\..\VolumeType\VolumeTypeArchive.MyDc'
if not VolName==SKIP
call "ArchiveDaily.bat"
@Echo ------------------------------------------------------
@Echo. end of All Monthly Defrag All Disk(s) Daily
@TIMEOUT /T 1 /NOBREAK >nul
