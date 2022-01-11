@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: AllYearly Defrag All Disk(s) Yearly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Yearly Disk(s) 
@Echo . System Disks
cd
 "SysYearly.bat"
@cd ScriptsYearly
@Echo ------------------------------------------------------
@Echo . Dev Disks
cd
call "DevYearly.bat"
@cd ScriptsYearly
@Echo ------------------------------------------------------
@Echo . Data Disks
cd
call "DataYearly.bat"
@cd ScriptsYearly
@Echo ------------------------------------------------------
@Echo . Archive Disks
cd
call "ArchiveYearly.bat"
@Echo ------------------------------------------------------
@Echo . end of All Monthly Defrag All Disk(s) Yearly
@TIMEOUT /T 1 /NOBREAK
