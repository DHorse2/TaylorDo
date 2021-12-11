@Echo off
@Echo - Command: Defrag Yearly Disk(s) Automatic
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo starting Defrag Yearly Disk(s) Automatic
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragSystemDiskYearly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDevDiskYearly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragDataDiskYearly.MyD"
@Echo ------------------------------------------------------
call "..\Commands\DoDefragAutomaticOn.bat"
"DefragArchiveDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo end of Defrag Yearly Disk(s) Automatic
@TIMEOUT /T 1 /NOBREAK
