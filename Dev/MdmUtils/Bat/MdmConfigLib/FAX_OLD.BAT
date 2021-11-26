@Rem
@Echo Off
:FAXLOCAL
@If %SysId%==%ServerId%           GoTo :FAXLAN
@If not exist \Fax\Old\*.*      GoTo :FAXLAN
@Echo.@
@Echo.@ ********************************
@Echo.@ **********  F A X E S  *********
@Echo.@ *******  A R C H I V E D *******
@Dir \Fax\Old\*.* /o:gden /p
@Echo.@
@Echo.@ There are faxes in \Fax\Old.
@Echo.@ ********************************
@Echo.@ ********************************
@Pause
:FAXLAN
@If not exist c:\Lan_On.Flg       GoTo :FAXESEND
@If not exist H:\Fax\Old\*.*      GoTo :FAXESEND
@If not %SysId%==%ServerId%       GoTo :FAXESEND
@Echo.@
@Echo.@ *********************************
@Echo.@ **  N E T W O R K   F A X E S  **
@Echo.@ *******  A R C H I V E D ********
@Dir H:\Fax\Old\*.* /o:gden /p
@Echo.@
@Echo.@ There are faxes in H:\Fax\Old on server %ServerId%.
@Echo.@ *********************************
@Echo.@ *********************************
@Pause
:FAXESEND
@Rem
@Echo.@
