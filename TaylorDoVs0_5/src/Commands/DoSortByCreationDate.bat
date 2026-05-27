@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoSortCreationDate
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoActionSortByCreationDate.MyDc" "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoSortCreationDate -----------------
@TIMEOUT /T 1 /NOBREAK >nul
