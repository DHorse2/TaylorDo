@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeC
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeC.txt"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeC -----------------
@TIMEOUT /T 1 /NOBREAK >nul
