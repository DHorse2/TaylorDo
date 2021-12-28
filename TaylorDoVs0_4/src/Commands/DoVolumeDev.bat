@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeDev
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeDev.MyDc"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo . 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeDev -----------------
@TIMEOUT /T 1 /NOBREAK
