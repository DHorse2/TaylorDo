@Rem
@Echo OFF
@Rem
@Echo.@ System...
@If exist \Sys_Stat.%PortId%      Del \Sys_Stat.%PortId% > nul
@If exist \Lan_Stat.%PortId%      Del \Lan_Stat.%PortId% > nul
@If exist \Aux_Stat.%PortId%      Del \Aux_Stat.%PortId% > nul
@If exist     c:\Lan_On.Flg       Call Lan_Stat %1
@If not exist c:\Lan_On.Flg       Call Sys_Stat %1
@Rem Call Sys_Stat %1
:MSGBEGIN
@Echo.@ Messages..
@If not exist c:\Lan_On.Flg       GoTo :MSGEND
@If exist M:\Msg\Out\%SysId%.Msg  COPY M:\Msg\Out\%SysId%.Msg c:\Msg\In > nul
:MSGEND
:DISP
@Echo.@ Check Inq..
@Rem MORE < \Sys_Stat.%PortId%
@If exist c:\%1True.Flg           GoTo :MORESKIP
@If A?==A%1                       MORE < \Sys_Stat.%PortId%
@If A/?==A%1                      MORE < \Sys_Stat.%PortId%
@If not exist \Log*.Flg           MORE < \Sys_Stat.%PortId%
:MORESKIP
@If not exist c:\%1True.Flg       COPY \Sys_Stat.%PortId% %1 > nul
@If not exist c:\%1True.Flg       GoTo :DISPEND
@If exist \Logoff.Flg             GoTo :DISPEND
@Echo.@ Route to Log device...
@If exist \LogCon.Flg  MORE < \Sys_Stat.%PortId%
@If exist \LogLpt1.Flg COPY \Sys_Stat.%PortId% LPT1 > nul
@If exist \LogLpt2.Flg COPY \Sys_Stat.%PortId% LPT3 > nul
@If exist \LogLpt3.Flg COPY \Sys_Stat.%PortId% LPT3 > nul
@If exist \LogCom1.Flg COPY \Sys_Stat.%PortId% COM1 > nul
@If exist \LogCom2.Flg COPY \Sys_Stat.%PortId% COM2 > nul
:DISPEND
@Echo.@
