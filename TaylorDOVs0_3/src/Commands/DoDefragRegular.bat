@Echo off
@Echo - Command: DoDefragRegular
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoSortRegular.bat"
@Echo 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoGapNoVacate.bat"
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoDefragRegular -----------------
@TIMEOUT /T 1 /NOBREAK
