cls
echo off
cls
echo                     Initialize hard disk for Kbil...
if %1 == C goto ddd
if %1 == c goto ddd
if %1 == D goto ddd
if %1 == d goto ddd
echo                     The command is KBILINIT C or KBILINIT D.
goto done
:ddd
echo on
mkdir %1:\cable
mkdir %1:\cable\kbil
mkdir %1:\cable\a
mkdir %1:\cable\bv
mkdir %1:\cable\cl
mkdir %1:\cable\fc
mkdir %1:\cable\gc
mkdir %1:\cable\gp
mkdir %1:\cable\pr
mkdir %1:\cable\sp
mkdir %1:\cable\w
mkdir %1:\cable\wh
mkdir %1:\dos
mkdir %1:\eft
mkdir %1:\remote
copy a:\dos\*.* %1:\dos
copy a:\*.* %1:\
del %1:\kbilinit.bat
:done
echo off
