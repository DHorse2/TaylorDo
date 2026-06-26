@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: ArchiveMontly Defrag Archive Disk Monthly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoDefragRegular.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeArchive.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Archive Disk Monthly
"DefragArchiveDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . end of ArchiveMontly Defrag Archive Disk Monthly
@TIMEOUT /T 1 /NOBREAK
