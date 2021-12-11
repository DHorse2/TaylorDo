@Echo off
@Echo - Command: DoGapVacate
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoGapVacate.MyDc"	        "..\ActionVerbs\ZoneDoGapThis.MyDc" /Y
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoGapVacate -----------------
@TIMEOUT /T 1 /NOBREAK
