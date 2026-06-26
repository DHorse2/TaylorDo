@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: AllDaily Defrag All Disk(s) Daily
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Daily Disk(s) 
cd ..
@Echo . System Disks
"DefragSystemDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . Dev Disks
"DefragDevDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . Data Disks
"DefragDataDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . Archive Disks
"DefragArchiveDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . end of AllDaily Defrag Daily Disk(s)
@TIMEOUT /T 1 /NOBREAK
