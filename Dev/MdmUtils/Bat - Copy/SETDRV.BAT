@Rem
@Echo OFF
@If not exist c:\Bat\SetDrv%1.Dat Echo   (%1)  Invalid Operating System Parameter!!!
@If     exist c:\Bat\SetDrv%1.Dat Set OpSys.Drv=%1
@If not exist c:\Bat\SetDrv%1.Dat Set OpSys.Drv=%opsys%
@If not exist c:\Bat\SetDrv%1.Dat Set OpSys.Drv=DOS
@Copy c:\Bat\SetDrv%OpSys.Drv%.Dat c:\SetDrv.Bat
@Copy c:\Bat\SetNatD%OpSys.Drv%.Dat c:\SetNatDrv.Bat
@Call c:\SetDrv
@Call c:\SetNatDrv
@Call c:\SetPROMPT
@Echo. The (OpSys.Drv) Operating System Drive is now %OpSys.Drv%.
