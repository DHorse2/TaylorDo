@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: Data Monthly Defrag Data Disk Monthly
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
@Echo . starting Defrag Data Disk Monthly
START /wait "" "DefragDataDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . end of Data Monthly Defrag Data Disk Monthly
@TIMEOUT /T 1 /NOBREAK
