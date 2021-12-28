@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoDefragFast
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoSortFast.bat"
@Echo . 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoGapNoVacate.bat"
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoDefragFast -----------------
@TIMEOUT /T 1 /NOBREAK
