@Rem
@Echo OFF
@Rem
@Echo.@ --Sys--
@CALL SYS_STAT %1
@Echo.@ --Lan--
@If exist \%1True.Flg GoTo :LANSKIP
@Rem Echo.@
@Echo.@ Server.
@Echo.@ > \Lan_Stat.%PortId%
@Rem Dir \Lan\Users\%ServerId% /w
@Dir \Lan\Users\%ServerId% /w >> \Lan_Stat.%PortId%
@Echo.@ System.
@Echo.@ >> \Lan_Stat.%PortId%
@Rem Dir \Lan\Users\%SysId% /w
@Dir \Lan\Users\%SysId% /w >> \Lan_Stat.%PortId%
@Echo.@ Network
@Echo.@ >> \Lan_Stat.%PortId%
@Echo.@ >> \Lan_Stat.%PortId%
@If %Lan%==LANTASTI               GoTo :LANTASTI
@If %Lan%==NETWARE                GoTo :NETWARE
@Echo.@ !!! NO NETWORK SELECTED !!! >> \Lan_Stat.%PortId%
@GoTo :LANEND
:LANTASTI
@Rem NET SHOW
@NET SHOW >> \Lan_Stat.%PortId%
@GoTo :LANEND
:NETWARE
:GoTo :LANEND
:LANEND
@Echo.@ Parms..
@Echo.@ You are machine %SysId% on port %PortId%. >>                   \Lan_Stat.%PortId%
@If not %ServerId%==%SysId%       Echo.@ Your server is %ServerId%. >> \Lan_Stat.%PortId%
@If not exist \%Link%True.Flg     Echo.@ You are linked to %Link% >>   \Lan_Stat.%PortId%
@Echo.@ >>  \Lan_Stat.%PortId%
@Echo.@ >>  \Lan_Stat.%PortId%
@Copy \Sys_Stat.%PortId%+\Lan_Stat.%PortId% \Sys_Stat.%PortId% > nul
:LANSKIP
@Echo.@ -------
