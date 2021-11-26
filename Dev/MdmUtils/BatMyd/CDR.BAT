@Rem
@Echo off
@Rem
@Call SetCdr
@Path = %OpSys.Drv%%CdrDir%;%Path%
@Rem If exist %Opsys.Drv%%CdrDir%\%CdrObj% %CdrCmd% %Opsys.Drv%%CdrDir%\%CdrObj%
@Rem M
