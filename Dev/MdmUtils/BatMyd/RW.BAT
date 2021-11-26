@Rem
@Echo off
@Rem
cls
SUBST D: /D
SUBST D: C:\RW
CD \RW
RUNCOBOL GL
CURSOR
echo on
pause press CTRL and BREAK then enter 'y' if you DON'T want to return....
echo off
CD \
SUBST D: /D
SUBST D: C:\
CLS
ECHO OFF
TYPE GETBACK.DAT
