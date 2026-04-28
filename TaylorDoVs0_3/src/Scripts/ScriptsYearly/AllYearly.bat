@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: AllYearly Defrag All Disk(s) Yearly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Yearly Disk(s) 
cd ..
@Echo . System Disks
call
@Echo ------------------------------------------------------
@Echo . Dev Disks
"DefragDevDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo . Data Disks
"DefragDataDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo . Archive Disks
"DefragArchiveDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo . end of Defrag Yearly Disk(s)
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . end of AllYearly Defrag All Disk(s) Yearly
@TIMEOUT /T 1 /NOBREAK
