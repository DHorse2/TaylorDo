@Echo off
@Echo - Command: DoMoveToEndOfDisk
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@copy "..\ActionVerbs\ZoneDoActionMoveToEndOfDisk.MyDc" "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
@Echo 
@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoMoveToEndOfDisk -----------------
@TIMEOUT /T 1 /NOBREAK
