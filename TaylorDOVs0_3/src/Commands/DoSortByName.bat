@Echo off
@Echo - Command: DoSortByName
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoActionSortByName.MyDc" "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoSortByName -----------------
@TIMEOUT /T 1 /NOBREAK
