@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: AllDaily Defrag All Disk(s) Daily
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Daily Disk(s) 
@Echo . System Disks
cd
call "SysDaily.bat"
@cd ScriptsDaily
@Echo ------------------------------------------------------
@Echo . Dev Disks
cd
call "DevDaily.bat"
@cd ScriptsDaily
@Echo ------------------------------------------------------
@Echo . Data Disks
cd
call "DataDaily.bat"
@cd ScriptsDaily
@Echo ------------------------------------------------------
@Echo . Archive Disks
cd
call "ArchiveDaily.bat"
@Echo ------------------------------------------------------
@Echo . end of All Monthly Defrag All Disk(s) Daily
@TIMEOUT /T 1 /NOBREAK
