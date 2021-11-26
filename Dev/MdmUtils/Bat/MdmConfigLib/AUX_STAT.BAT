@Rem
@Echo OFF
@Rem
@Echo.@ --Aux--
@If exist \%1True.Flg        GOTO :AUXSKIP
@Rem If exist \Aux_On.Flg   Echo.@ The auxillary port is on.
@If exist \Aux_On.Flg       Echo.@ The auxillary port is on. >> \Sys_Stat.%PortId%
:AUXSKIP
@Echo.@ -------
