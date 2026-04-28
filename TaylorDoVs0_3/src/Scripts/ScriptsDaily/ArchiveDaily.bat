@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: ArchiveDaily Defrag Archive Disk Daily
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoStateSave.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoDefragFast.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoVolumeArchive.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Archive Disk Daily
"DefragArchiveDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . end of ArchiveDaily Defrag Archive Disk Daily
@TIMEOUT /T 1 /NOBREAK
