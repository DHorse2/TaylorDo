@Echo off
@Echo - Command: DoSortCreationDate
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoActionSortByCreationDate.MyDc" "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoSortCreationDate -----------------
@TIMEOUT /T 1 /NOBREAK
