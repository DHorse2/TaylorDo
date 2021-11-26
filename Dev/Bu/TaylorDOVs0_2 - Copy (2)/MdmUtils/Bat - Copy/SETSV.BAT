@Rem
@Echo Off
@Rem
@Echo.@
@IF not exist %OpSys.Drv%\Bat\Set%1.Dat Echo.@ (%1)  Invalid Parameter!!!
@IF     exist %OpSys.Drv%\Bat\Set%1.Dat Set ServerId=%1
@IF not exist %OpSys.Drv%\Bat\Set%1.Dat Set ServerId=%OpSys%
@IF not exist %OpSys.Drv%\Bat\Set%1.Dat Set ServerId=DOS
@Copy %OpSys.Drv%\Bat\Set%ServerId%.Dat %OpSys.Drv%\SetServerId.Bat
@Call %OpSys.Drv%\SetServerId
@Call %OpSys.Drv%\SetPROMPT
@Echo.@ The Server Id is now %ServerId%.
