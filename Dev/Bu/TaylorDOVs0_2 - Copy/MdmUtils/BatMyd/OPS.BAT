@Rem
@Echo Off
@Rem
:SETBEG
@Call Ops_Set
@Echo.@
@If     exist %OpSys.Drv%%OpsDir%\%1True.Flg GoTo :SETDO
@Rem    Move True.Flg Over to OpSys directory
@Copy   %OpSys.Drv%\True.Flg                 %OpSys.Drv%\%1
@Echo.@
@If not exist %OpSys.Drv%\%1\True.Flg        GoTo :SETEND
@If     exist %OpSys.Drv%\Bat\Set%1.Dat      Set OpSys=%1
@Call Ops_Set
@Echo.@
@If not exist %OpSys.Drv%%OpsDir%\%1True.Flg GoTo :SETEND
:SETDO
@If not exist %OpSys.Drv%%OpsDir%\%OpsObj%   GoTo :SETEND
@%OpSys.Drv%
@Cd \
@Cd %OpsDir%
@Rem Cd Curr
@%OpsCmd% %OpSys.Drv%%OpsDir%\%OpsObj%
:SETEND
@Call SetPrompt
@Echo.@
@Echo.@ The OpSys Operating system is now %OpSys%.
