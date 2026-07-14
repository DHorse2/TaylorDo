@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeD
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeD.txt"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeD -----------------
@TIMEOUT /T 1 /NOBREAK >nul
