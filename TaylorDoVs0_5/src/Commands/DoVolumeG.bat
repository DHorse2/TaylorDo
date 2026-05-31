@Echo off
setlocal EnableExtensions EnableDelayedExpansion
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeG
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeG.MyDc"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeG -----------------
@TIMEOUT /T 1 /NOBREAK >nul
