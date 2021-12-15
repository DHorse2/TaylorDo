@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: ArchiveYearly
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoDefragFull.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeArchive.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Archive Disk Yearly
"DefragArchiveDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo . end of ArchiveYearly
@TIMEOUT /T 1 /NOBREAK
