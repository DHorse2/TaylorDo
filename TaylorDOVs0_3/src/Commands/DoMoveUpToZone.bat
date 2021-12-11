@Echo off
@Echo - Command: DoMoveUpToZone
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\ActionVerbs\ZoneDoActionMoveUpToZone.MyDc" "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoMoveUpToZone -----------------
@TIMEOUT /T 1 /NOBREAK
