@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Archive Monthly Defrag Archive Disk Monthly
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
START /wait "" "DefragArchiveDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . end of Archive Monthly Defrag Archive Disk Monthly
@TIMEOUT /T 1 /NOBREAK
