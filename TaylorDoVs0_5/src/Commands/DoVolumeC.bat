@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeC
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeC.MyDc"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeC -----------------
@TIMEOUT /T 1 /NOBREAK >nul
