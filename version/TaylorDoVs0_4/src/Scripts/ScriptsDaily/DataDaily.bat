@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DataDaily Defrag Data Disk Daily
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
call "..\Commands\DoVolumeData.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Data Disk Daily
START /wait "" "DefragDataDiskDaily.MyD"
@Echo ------------------------------------------------------
@Echo . end of DataDaily Defrag Data Disk Daily
@TIMEOUT /T 1 /NOBREAK
