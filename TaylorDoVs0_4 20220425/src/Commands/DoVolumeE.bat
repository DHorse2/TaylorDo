@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeE
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeE.MyDc"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeE -----------------
@TIMEOUT /T 1 /NOBREAK >nul
