@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoDefragFull
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoSortFull.bat"
@Echo . 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoGapNoVacate.bat"
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoDefragFull -----------------
@TIMEOUT /T 1 /NOBREAK
