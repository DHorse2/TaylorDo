@Echo off
@Echo - Command: DoGapNoVacate
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoGapNoVacate.MyDc"	        "..\ActionVerbs\ZoneDoGapThis.MyDc" /Y
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoGapNoVacate -----------------
@TIMEOUT /T 1 /NOBREAK
