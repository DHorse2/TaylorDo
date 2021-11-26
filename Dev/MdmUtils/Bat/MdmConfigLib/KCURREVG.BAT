@Echo OFF
@Rem
@Cls
@Echo.
@Echo.          K-bil by Axion
@Echo.         Current Release
@Echo.            REV BOOT
@Echo.
@Call KExeRevG CURR %2
@Echo.
@Call SetDrv
@%OpSys.Drv%
@Cd \
@If exist cursor.com             CURSOR
@Echo OFF
@Cls
M
