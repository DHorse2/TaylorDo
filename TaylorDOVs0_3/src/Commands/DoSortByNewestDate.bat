@Echo off
@Echo - Command: DoSortByNewestDate
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoActionSortByNewestDate.MyDc" "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoSortByNewestDate -----------------
@TIMEOUT /T 1 /NOBREAK
