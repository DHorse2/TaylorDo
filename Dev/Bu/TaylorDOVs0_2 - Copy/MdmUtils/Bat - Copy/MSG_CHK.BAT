@rem
@echo OFF
@rem  ---------------------
:MSGS
@IF not exist c:\msg\in\*.*       GOTO :MSGSEND
@echo.
@echo. ********************************
@echo. *******  M E S S A G E S  ******
@echo. *******  R E C E I V E D *******
@echo.
@DIR c:\msg\in\*.* /o:gne /p
@echo. There are messages in \MSG\IN.
@echo.
@PAUSE
:MSGSEND
@rem  ---------------------
