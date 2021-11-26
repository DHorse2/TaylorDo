@Rem
@Echo Off
@Rem
@If not exist %OpSys.Drv%\%1True.Flg Set OPSYS=%1
@If exist %OpSys.Drv%\%1True.Flg Set OPSYS=%NATIVE%
@Call SetPROMPT
@Echo.@ The OPSYS Operating system is now %OPSYS%.
