@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DataWeekly Defrag Data Disk Weekly
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
call "..\Commands\DoVolumeData.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Data Disk Weekly
"DefragDataDiskWeekly.MyD"
@Echo ------------------------------------------------------
@Echo . end of DataWeekly Defrag Data Disk Weekly
@TIMEOUT /T 1 /NOBREAK
