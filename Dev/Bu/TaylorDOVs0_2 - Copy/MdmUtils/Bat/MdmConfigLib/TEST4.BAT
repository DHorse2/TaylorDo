@Rem
@Echo Off
@Rem
@If not exist %OpSys.Drv%\Rev.flg                 GoTo DRVCHNG


@If exist .\Dat\%1.Std    Copy \On.Flg \%1.Flg
@Rem
Echo.     Paramater %1 being set to %2.
:PARMINVALID
@Rem
@GoTo PROCEND
@Rem
:ARGEMPTY
@Rem
Echo.     Paramater is being set to empty.
@GoTo PROCEND
@Rem
:PROCEND
@Rem
