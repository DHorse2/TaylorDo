@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoGapNoVacate
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoGapNoVacate.MyDc"	        "..\ActionVerbs\ZoneDoGapThis.MyDc" /Y
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoGapNoVacate -----------------
@TIMEOUT /T 1 /NOBREAK
