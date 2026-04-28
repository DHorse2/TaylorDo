@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: AllWeekly Defrag All Disk(s) Weekly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Weekly Disk(s) 
cd ..
@Echo . System Disks
"DefragSystemDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . Dev Disks
"DefragDevDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . Data Disks
"DefragDataDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . Archive Disks
"DefragArchiveDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . end of Defrag Weekly Disk(s)
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . end of AllWeekly Defrag All Disk(s) Weekly
@TIMEOUT /T 1 /NOBREAK
