@Rem
@Echo off
@Rem
@Call SetMsd
@Path = %OpSys.Drv%%MsdDir%;%Path%
@If exist %Opsys.Drv%%MsdDir%\%MsdObj% %MsdCmd% %Opsys.Drv%%MsdDir%\%MsdObj% %1 %2 %3 %4 %5 %6 %7 %8 %9
@M
