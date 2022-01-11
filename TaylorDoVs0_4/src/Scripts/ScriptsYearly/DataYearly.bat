@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DataYearly
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
call "..\Commands\DoVolumeData.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . starting Defrag Data Disk Yearly
START /wait "" "DefragDataDiskYearly.MyD"
@Echo ------------------------------------------------------
@Echo . end of DataYearly
@TIMEOUT /T 1 /NOBREAK
