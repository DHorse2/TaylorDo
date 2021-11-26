@Echo off
@Rem
@Call SetPct
@Path = %OpSys.Drv%%PctDir%;%Path%
@If exist %Opsys.Drv%%PctDir%\%PctObj% %PctCmd% %Opsys.Drv%%PctDir%\%PctObj%
@M
