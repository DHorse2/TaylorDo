@rem
@echo OFF
:MSGLOCAL
@IF not exist C:\msg\old\*.* GOTO :MSGLAN
@echo.
@echo ********************************
@echo *******  M E S S A G E S  ******
@echo *******  A R C H I V E D *******
@DIR C:\msg\old\*.* /o:gden /p
@echo.
@echo. There are msges in C:\MSG\OLD.
@echo ********************************
@echo ********************************
@PAUSE
:MSGLAN
@IF not exist C:\lan_on.flg GOTO :MSGESEND
@IF not exist G:\msg\old\*.* GOTO :MSGESEND
@IF not %sysid%==%serverid% GOTO :MSGESEND
@echo.
@echo *********************************
@echo **  NETWORK   M E S S A G E S  **
@echo *******  A R C H I V E D ********
@DIR g:\msg\old\*.* /o:gden /p
@echo.
@echo. There are msges in G:\MSG\OLD on server %serverid%.
@echo *********************************
@echo *********************************
@PAUSE
:MSGESEND
@rem
@echo.
