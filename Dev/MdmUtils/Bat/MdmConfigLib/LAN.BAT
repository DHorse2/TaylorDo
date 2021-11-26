@Rem
@Echo off
@Rem
@Echo.@
@Echo.@ *********** LAN PROCEDURE *************
@Echo.@
@Echo.@ setup environment
@Echo.@
@CaLL SetPATH
@CaLL SetID
@Call SysID
@CaLL SetSERVER
@Call Sys_Stat
@Rem Call Sys_Stat OK
@Echo.@
@Echo.@ check settings
@Echo.@
@If exist c:\Lan_On.Flg           GoTo :LANON
@If exist c:\Lan_No.Flg           GoTo :LANOFF
@If exist c:\Lan_Perm.Flg         GoTo :LANSTART
@If not exist c:\Lan_On.Flg       GoTo :LANPROMPT
:LANPROMPT
@Echo off
@Echo.@
@Echo.@
@Echo.@  Enter the network setting:
@Echo.@
@Echo.@    {ctrl}+Z     to leave the network OFF.
@Echo.@    ON{ctrl}+Z   to start the nextwork.
@Echo.@
@Echo.@ your response:
@Del Lan_On.Flg
@Copy CON: c:\Lan_On.Flg /b
@Echo.@
@If not exist Lan_On.Flg          GoTo :LANOFF
@Rem
@Rem ...............
@Rem
:LANSTART
@Rem
@Copy c:\Lan_Desc.Doc+c:\Start.Flg /a c:\Lan_Stat.Flg /a
@Copy c:\Start.Flg c:\Lan_On.Flg
@Rem If exist h:\true.Flg SUBST h: /D
@Cd \Lantasti
@Rem @Path=c:\Lantasti;%Path%
@CaLL SetPath
@Rem Call c:\Lantasti\STARTNET
@Call c:\Lantasti\Lant_Start
@Call c:\Lantasti\LOGIN
Rem @If not %SysId%==SERVER1      Call c:\Lantasti\LINK SERVER1
Rem @If not %SysId%==PC1          Call c:\Lantasti\LINK PC1
If %SysId%==%ServerId%            GoTo :LANON
If not %Link%==%ServerId%         Call c:\Lantasti\LINK %ServerId%
@Rem
@Rem ...............
@Rem
:LANON
@Rem
@Cd \
@Echo.@
@Echo.@               The LAN is ON
@Echo.@
@GoTo :LANEND
@Rem
@Rem ...............
@Rem
:LANOff
@Rem
@Rem Copy c:\Off.Flg c:\Lan_On.Flg
@SUBST h: C:\
@Echo.@
@Echo.@               The LAN is Off
@Echo.@        you should use FastOpen under DOS
@Rem @LOADHIGH c:\dos\FASTOPEN.EXE C:=255 /x
@GoTo :LANEND
@Rem
@Rem ...............
@Rem
:LANEND
@Rem
@Echo.@
@Echo.@ *** End of Lan Control ***
@Echo.@
@Echo.@ Network Flags, Verbs, Directories and Files:
@DIR c:\Lan*.* /w /b /l
@If not exist c:\Lan_On.Flg       Call Sys_Stat
@If exist c:\Lan_On.Flg           Call Lan_Stat
@Echo.@
@Echo.@ Network Commands:
@Echo.@ LAN  LINK        Lan_Stat  Sys_Stat         Lan_On  Lan_Off  SETLAN
@Echo.@
