@Echo OFF
@Rem
@Cls
@Echo.
@Echo.          K-bil by Axion
@Echo.         Demonstration Release
@Echo.            REV BOOT
@Echo.
@Call KExeRevG DEMO %2
@Echo.
@Call SetDrv
@%OpSys.Drv%
@Cd \
@If exist cursor.com             CURSOR
@Echo OFF
@Cls
M
