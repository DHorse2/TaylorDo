@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoDefragAutomaticOn
@Echo ------------------------------------------------------
@Echo - Do Automatic Run (Hack) disabled.
Copy "..\ActionVerbs\Automatic\ZoneDoActionInteractive.MyDc"	        "..\ActionVerbs\ZoneDoActionAutomaticThis.MyDc" /Y
@Rem Copy "..\ActionVerbs\Automatic\ZoneDoActionAutomatic.MyDc"	        "..\ActionVerbs\ZoneDoActionAutomaticThis.MyDc" /Y
@Echo ------------------------------------------------------
@Echo - End of DoDefragAutomaticOn -----------------
@TIMEOUT /T 1 /NOBREAK
