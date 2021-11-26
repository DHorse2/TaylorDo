@Rem
@Echo Off
:FAX
@Rem
:FAXRTN
@If %SysId%==%ServerId%           GoTo :NFAX
@If not exist c:\Fax.flg          GoTo :FAXES
@Echo.@
@Echo.@  Rememeber to load you FAX software
@Rem CALL FAX_LOAD
@Rem LOADFAX
@Echo.@
@Rem :FAXRTNEND
:FAXES
@Rem
:FAXIN
@If not exist c:\Fax\In\*.Rec    Echo.@  There are no incoming faxes.
@If not exist c:\Fax\In\*.Rec    GoTo :FAXOUT
@Echo.@
@Echo.@ ********************************
@Echo.@ **********  F A X E S  *********
@Echo.@ *******  R E C E I V E D *******
@Dir c:\Fax\In\*.Rec /o:gden /p
@Echo.@
@Echo.@ There are faxes in c:\Fax\In.
@Echo.@ ********************************
@Echo.@ ********************************
@PAUSE
@Echo.@
:FAXOUT
@If not exist c:\Fax\Out\*.Rec    Echo.@  There are no outgoing faxes.
@If not exist c:\Fax\Out\*.Rec    GoTo :NFAX
@Echo.@
@Echo.@ ********************************
@Echo.@ **********  F A X E S  *********
@Echo.@ ********  W A I T I N G ********
@Dir c:\Fax\Out\*.Rec /o:gden /p
@Echo.@
@Echo.@ There are faxes in c:\Fax\Out.
@Echo.@ ********************************
@Echo.@ ********************************
@PAUSE
@Echo.@
:NFAX
@If not exist c:\Lan_On.Flg       GoTo :FAXEND
@Rem IF %SysId%==%ServerId%       GoTo :FAXEND
:NFAXIN
@If not exist H:\Fax\In\*.Rec     Echo.@  There are no incoming network faxes.
@If not exist H:\Fax\In\*.Rec     GoTo :NFAXOUT
@Echo.@ ********************************
@Echo.@ ********  N E T W O R K ********
@Echo.@ **********  F A X E S  *********
@Echo.@ *******  R E C E I V E D *******
@Dir H:\Fax\In\*.Rec /o:gden /p
@Echo.@
@Echo.@ There are faxes in H:\Fax\In.
@Echo.@ ********************************
@Echo.@ ********************************
@PAUSE
@Echo.@
:NFAXOUT
@If not exist H:\Fax\Out\*.Rec    Echo.@  There are no outgoing network faxes.
@If not exist H:\Fax\Out\*.Rec    GoTo :FAXEND
@Echo.@
@Echo.@ *********************************
@Echo.@ ********  N E T W O R K ********
@Echo.@ **********  F A X E S  *********
@Echo.@ ********  W A I T I N G ********
@Dir H:\Fax\Out\*.Rec /o:gden /p
@Echo.@
@Echo.@ There are faxes in H:\Fax\Out on Server %ServerId%.
@Echo.@ *********************************
@Echo.@ *********************************
@PAUSE
:FAXEND
@c:
@Rem
