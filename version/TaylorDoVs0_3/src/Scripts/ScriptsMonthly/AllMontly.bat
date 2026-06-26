@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: AllMontly Defrag All Disk(s) Monthly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Monthly Disk(s) 
cd ..
@Echo . System Disks
"DefragSystemDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . Dev Disks
"DefragDevDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . Data Disks
"DefragDataDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . Archive Disks
"DefragArchiveDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . end of AllMontly Defrag All Disk(s) Monthly
@TIMEOUT /T 1 /NOBREAK
