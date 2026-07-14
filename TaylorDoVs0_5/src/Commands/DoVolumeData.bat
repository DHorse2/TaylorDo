@Echo off
@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeData
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeData.txt"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo. 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeData -----------------
@TIMEOUT /T 1 /NOBREAK >nul
