@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: All Monthly Defrag All Disk(s) Monthly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Monthly Disk(s) 
cd ..
@Echo ------------------------------------------------------
@Echo . System Disks
@cd
set /p VolName=<..\VolumeType\VolumeTypeSys.MyDc
@Echo . Volume: %VolName%
pause()
if not VolName==SKIP
call "SysMonthly.bat"
@cd ScriptsMonthly
@Echo ------------------------------------------------------
@Echo . Dev Disks
cd
set /p VolName=<'..\VolumeType\VolumeTypeDev.MyDc'
if not VolName==SKIP
call "DevMonthly.bat"
@cd ScriptsMonthly
@Echo ------------------------------------------------------
@Echo . Data Disks
cd
set /p VolName=<'..\VolumeType\VolumeTypeData.MyDc'
if not VolName==SKIP
call "DataMonthly.bat"
@cd ScriptsMonthly
@Echo ------------------------------------------------------
@Echo . Archive Disks
cd
set /p VolName=<'..\VolumeType\VolumeTypeArchive.MyDc'
if not VolName==SKIP
call "ArchiveMonthly.bat"
@Echo ------------------------------------------------------
@Echo . end of All Monthly Defrag All Disk(s) Monthly
@TIMEOUT /T 1 /NOBREAK
pause()
