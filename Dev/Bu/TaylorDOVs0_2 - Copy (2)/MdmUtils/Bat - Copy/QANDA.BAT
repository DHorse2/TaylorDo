echo off
cls
echo          Revelation QUESTION and ANSWER session
command /c spool
c:
CD \CABLE\REVG2B
cursor
echo on
MEMFIX_G
REV QUESTION
c:
cd \
cursor
echo off
cls
type getback.dat
