@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: AllWeekly Defrag All Disk(s) Weekly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Weekly Disk(s) 
@Echo . System Disks
cd
call "SysWeekly.bat"
@cd ScriptsWeekly
@Echo ------------------------------------------------------
@Echo . Dev Disks
cd
call "DevWeekly.bat"
@cd ScriptsWeekly
@Echo ------------------------------------------------------
@Echo . Data Disks
cd
call "DataWeekly.bat"
@cd ScriptsWeekly
@Echo ------------------------------------------------------
@Echo . Archive Disks
cd
call "ArchiveWeekly.bat"
@Echo ------------------------------------------------------
@Echo . end of All Monthly Defrag All Disk(s) Weekly
@TIMEOUT /T 1 /NOBREAK
