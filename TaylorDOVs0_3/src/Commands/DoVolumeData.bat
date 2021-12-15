@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeData
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeData.MyDc"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo . 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeData -----------------
@TIMEOUT /T 1 /NOBREAK
