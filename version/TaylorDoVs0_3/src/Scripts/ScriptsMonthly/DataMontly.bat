@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DataMontly Defrag Data Disk Monthly
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
"DefragDataDiskMonthly.MyD"
@Echo ------------------------------------------------------
@Echo . end of DataMontly Defrag Data Disk Monthly
@TIMEOUT /T 1 /NOBREAK
