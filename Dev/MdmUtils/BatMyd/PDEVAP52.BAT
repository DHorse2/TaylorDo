@Echo OFF
@Rem
@Cls
@Echo.
@Echo.            K-bil by Axion
@Echo.         Development Release
@Echo.            AP PICK BOOT
@Echo.
@Call PExeAP52 DEV %2
@Echo.
@Call SetDrv
@%OpSys.Drv%
@Cd \
@If exist cursor.com             CURSOR
@Echo OFF
@Cls
M
