@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoReset
@TIMEOUT /T 1 /NOBREAK
@Echo Do Sort Regular
call "..\Commands\DoSortRegular.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo . 
@Echo Do Gap No Vacate
call "..\Commands\DoGapNoVacate.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Do State Save
call "..\Commands\DoStateSave.bat"
@Echo . 
@Echo - End of DoReset -----------------
@TIMEOUT /T 1 /NOBREAK
