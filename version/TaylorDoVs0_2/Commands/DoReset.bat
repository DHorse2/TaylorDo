@Echo off
@Echo -------- Command: DoReset
@TIMEOUT /T 1 /NOBREAK
call "..\Commands\DoSortRegular.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoGapNoVacate.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoStateSave.bat"
@Echo 
@Echo --------------- End of DoReset -----------------
@TIMEOUT /T 1 /NOBREAK
