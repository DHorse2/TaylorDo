@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoDefragAutomaticOff
@Echo ------------------------------------------------------
@Echo - Do Interactive Run
Copy "..\ActionVerbs\Automatic\ZoneDoActionInteractive.MyDc"	        "..\ActionVerbs\ZoneDoActionAutomaticThis.MyDc" /Y
@Echo ------------------------------------------------------
@Echo - End of DoDefragAutomaticOff -----------------
@TIMEOUT /T 1 /NOBREAK
