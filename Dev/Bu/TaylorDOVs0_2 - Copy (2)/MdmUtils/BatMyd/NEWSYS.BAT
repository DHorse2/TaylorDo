@Rem
@Echo Off
@Rem
@Echo.@ This command will set up NEW SYSTEM DEFAULTS!!!
pause
@If exist c:\true.flg Echo. System Set (true.flg)
@If exist c:\true.flg GoTo :NEWEND
@C:
@Cd \Bat
@Rem
@Rem *** Set Default Hardware Configuration ***
@Copy c:\Bat\Con00001.Cfg c:\
@Copy c:\Bat\Null0001.Cfg c:\
@Copy c:\Bat\Drive00C.Cfg c:\
@Copy c:\Bat\Com00001.Cfg c:\
@Copy c:\Bat\Lpt00001.Cfg c:\
@Rem
@Rem ** Move Required Flags to Root **
@Copy c:\Bat\On.Flg c:\
@Copy c:\Bat\On.Flg c:\True.Flg
@Copy c:\Bat\On.Flg c:\False.Flg
@Copy c:\Bat\On.Flg c:\Off.Flg
@Rem
@Rem ** Move Critical Setting to Root **
@Copy c:\Bat\SetPath.Bat c:\
@Copy c:\Bat\SetPrompt.bat c:\
@Rem Copy c:\Bat\SetId.Bat c:\
@Rem Copy c:\Bat\SetServer.bat c:\
@Rem
@Rem ** Set Operating System **
@Call c:\Bat\ID_Set PC1
@Call c:\Bat\Srv_Set SV1
@Call c:\Bat\SetDrv C
@Call c:\Bat\SetNatDrv C
@Call c:\Bat\SetNative DOS
@Rem Call c:\Bat\Ops_Dos
@Call c:\Bat\SetOps
@Call c:\Bat\Lan_Off
@Rem
@Rem **** Install Menus ****
@Copy c:\Bat\GetBack.Dat c:\
@Copy c:\Bat\Next.Dat c:\
@Rem
@Rem **** Set Default Software ****
@Call Smt_On
@Call Shr_On
@Call Fst_On
@Call Mou_On
@Call Mou_NoHi
@Call Dky_On
@Call Utl_On
@Rem
@Rem **** End ****
@Rem
:NEWEND
@Rem
