@Echo off
@Echo - Command: Defrag Monthly Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo starting Defrag Monthly Disk(s) Automatic
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragSystemDiskMonthly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDevDiskMonthly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDataDiskMonthly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragArchiveDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo end of Defrag Monthly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
