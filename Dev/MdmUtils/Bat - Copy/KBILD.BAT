COPY KBILD.DAT D:\CABLE\REVG2B
@ECHO OFF
cls
echo          K-bil by Axion
cursor
echo on
D:
CD \CABLE\REVG2B
MEMFIX_G
REV CABLE
d:
cd \
cursor
@ECHO OFF
C:
cls
type getback.dat
