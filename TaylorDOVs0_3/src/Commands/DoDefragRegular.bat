@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoDefragRegular
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoSortRegular.bat"
@Echo . 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoGapNoVacate.bat"
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoDefragRegular -----------------
@TIMEOUT /T 1 /NOBREAK
