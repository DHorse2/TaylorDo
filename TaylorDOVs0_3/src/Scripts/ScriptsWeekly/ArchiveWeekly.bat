@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: ArchiveWeekly Defrag Archive Disk Weekly
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
@Echo . starting Defrag Archive Disk Weekly
"DefragArchiveDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . end of ArchiveWeekly Defrag Archive Disk Weekly
@TIMEOUT /T 1 /NOBREAK
