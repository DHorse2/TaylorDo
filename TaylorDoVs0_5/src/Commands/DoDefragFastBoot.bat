@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoDefragFastBoot
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoSortFastBoot.bat"
@Echo. 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
call "..\Commands\DoGapNoVacate.bat"
@Echo. 
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoDefragFastBoot -----------------
@TIMEOUT /T 1 /NOBREAK >nul
