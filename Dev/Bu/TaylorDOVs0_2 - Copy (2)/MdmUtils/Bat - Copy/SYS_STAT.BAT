@Rem
@Echo Off
@Rem
@Echo.@
@Echo.@  --System Stat-
@If exist \%1True.Flg GoTo :STATSKIP
@Echo.@  Config.
@If exist c:\Lan_On.Flg NET SHOW/BATCH > c:\net00001.Cfg
@Dir c:\*.Cfg /o:n /b > c:\%SysId%.Cfg
@Dir c:\*.Cfg /o:n /b > \%SysId%.%PortId%
@Echo.@  Port...
@Echo.@  >  \Sys_Stat.%PortId%
@Echo.@  >> \Sys_Stat.%PortId%
@Echo.@ You are machine %SysId% on port %PortId%. >>               \Sys_Stat.%PortId%
@If not %ServerId%==%SysId% Echo.@ Your server is %ServerId%. >>   \Sys_Stat.%PortId%
@If not exist c:\%Link%True.Flg Echo.@ You are linked to %Link% >> \Sys_Stat.%PortId%
@Echo.@  >>  \Sys_Stat.%PortId%
@Echo.@  >>  \Sys_Stat.%PortId%
@Rem @VER
@Echo.@  Vs.....
@VER >     \VER.%PortId%
@VER >>    \Sys_Stat.%PortId%
@Echo.@  >>  \Sys_Stat.%PortId%
@Rem @PATH
@Echo.@  Path...
@PATH >    \PATH.%PortId%
@PATH >>   \Sys_Stat.%PortId%
@Echo.@  >>  \Sys_Stat.%PortId%
@Rem @SET
@Echo.@  Envr..
@SET >     \ENVIRON.%PortId%
@SET >>    \Sys_Stat.%PortId%
@Echo.@  >>  \Sys_Stat.%PortId%
@Rem @MEM /D
@Echo.@  Mem....
@MEM /D >  \MEM.%PortId%
@MEM /D >> \Sys_Stat.%PortId%
@Echo.@  Parms..
@Echo.@  >>  \Sys_Stat.%PortId%
@Echo.@  >>  \Sys_Stat.%PortId%
@Echo.@  >>  \Sys_Stat.%PortId%
@Rem IF exist \Lan_desc.%PortId%  TYPE \Lan_desc.%PortId%
@If exist \Lan_desc.%PortId%      TYPE \Lan_desc.%PortId% >>                      \Sys_Stat.%PortId%
@Rem IF exist \Lan_perm.Flg       Echo.@ The network boots automatically.
@If exist \Lan_perm.Flg           Echo.@ The network boots automatically. >>        \Sys_Stat.%PortId%
@Rem IF exist \Lan_no.Flg         Echo.@ The network doesn't boot automatically.
@If exist \Lan_no.Flg             Echo.@ The network doesn't boot automatically. >> \Sys_Stat.%PortId%
@Rem IF exist \Lan_On.Flg         Echo.@ The network is running.
@If exist \Lan_On.Flg             Echo.@ The network is running. >>                 \Sys_Stat.%PortId%
@Rem IF exist \mouse.Flg          Echo.@ There is a mouse.
@If exist \mouse.Flg              Echo.@ There is a mouse. >>                       \Sys_Stat.%PortId%
@Rem IF exist \doskey.Flg         Echo.@ There is doskey in use.
@If exist \doskey.Flg             Echo.@ There is doskey in use. >>                 \Sys_Stat.%PortId%
@Rem IF exist \fax.Flg            Echo.@ There is a fax in use.
@If exist \fax.Flg                Echo.@ There is a fax in use. >>                  \Sys_Stat.%PortId%
@Rem IF exist \loglpt1.Flg        Echo.@ Logging status to the printer.
@If exist \loglpt1.Flg            Echo.@ Logging status to the printer. >>          \Sys_Stat.%PortId%
@Rem IF exist \logcom1.Flg        Echo.@ Logging status to the COM1.
@If exist \logcom1.Flg            Echo.@ Logging status to the COM1. >>             \Sys_Stat.%PortId%
@Rem IF exist \logcom2.Flg        Echo.@ Logging status to the COM2.
@If exist \logcom2.Flg            Echo.@ Logging status to the COM2. >>             \Sys_Stat.%PortId%
@CALL AUX_STAT %1
@Rem Echo.@ The operating system is %OPSYS%.
@Echo.@ The operating system is %OPSYS%. >>                                         \Sys_Stat.%PortId%
@Rem Echo.@ The native operating system is %NATIVE%.
@Echo.@ The native operating system is %NATIVE%. >>                                 \Sys_Stat.%PortId%
:STATSKIP
:STATEND
@Echo.@  -------
