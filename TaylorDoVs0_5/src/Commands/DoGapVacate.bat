@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoGapVacate
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoGapVacate.MyDc"	        "..\ActionVerbs\ZoneDoGapThis.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoGapVacate -----------------
@TIMEOUT /T 1 /NOBREAK >nul
