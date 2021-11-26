@Rem
@Echo OFF
@Rem
@Call SetFax
@Path = %OpSys.Drv%%FaxDir%;%Path%
@If exist %Opsys.Drv%%FaxDir%\%FaxObj% %FaxCmd% %Opsys.Drv%%FaxDir%\%FaxObj%
@M
