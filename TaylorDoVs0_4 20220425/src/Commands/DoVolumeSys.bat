@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DoVolumeSys
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
copy "..\VolumeType\VolumeTypeSys.MyDc"	        "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y
@Echo . 
@Echo ------------------------------------------------------
@Echo - End of DoVolumeSys -----------------
@TIMEOUT /T 1 /NOBREAK
