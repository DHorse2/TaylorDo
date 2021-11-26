@Rem
@Echo off
@Rem
ECHO Are you on
COPY CON: LAN.ON
REM COPY CON: %3
REM COPY LAN.ON %3
IF EXIST LAN.ON ECHO Lan is on
IF "ON"==%3 ECHO I am on
