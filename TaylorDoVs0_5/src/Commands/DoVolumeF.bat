@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeF
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeF.MyDc"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeF -----------------
@TIMEOUT /T 1 /NOBREAK >nul
