@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoEnvironmentClear ToDo 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoSortFast.bat"
@Echo. 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoGapNoVacate.bat"
@Echo. 
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoEnvironmentClear -----------------
@TIMEOUT /T 1 /NOBREAK >nul
pause()