@Rem
@Echo Off
@Rem
@Set OpsCmd=
@Set OpsDir=\%OpSys%
@Set OpsObj=
@If exist %OpSys.Drv%%OpsDir%\%OpSys%.Bat    Set OpsCmd=Call
@If exist %OpSys.Drv%%OpsDir%\%OpSys%.Bat    Set OpsObj=%OpSys%.Bat
@If exist %OpSys.Drv%%OpsDir%\%OpSys%.Com    Set OpsObj=%OpSys%.Com
@If exist %OpSys.Drv%%OpsDir%\%OpSys%.Exe    Set OpsObj=%OpSys%.Exe
@Call %OpSys%_Set.Bat
