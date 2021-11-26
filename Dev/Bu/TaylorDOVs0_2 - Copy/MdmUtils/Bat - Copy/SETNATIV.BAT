@Rem
@Echo Off
@Rem
@Echo.@
@IF not exist %OpSys.Drv%\Bat\Set%1.Dat Echo.@ (%1)  Invalid Operating System Parameter!!!
@IF     exist %OpSys.Drv%\Bat\Set%1.Dat Set Native=%1
@IF not exist %OpSys.Drv%\Bat\Set%1.Dat Set Native=%OpSys%
@IF not exist %OpSys.Drv%\Bat\Set%1.Dat Set Native=DOS
@Copy %OpSys.Drv%\Bat\Set%Native%.Dat %OpSys.Drv%\SetNative.Bat
@Call %OpSys.Drv%\SetNative
@Call %OpSys.Drv%\SetPROMPT
@Echo.@ The Native Operating System is now %Native%.
