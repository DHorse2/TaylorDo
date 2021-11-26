@rem
@rem echo OFF
@rem echo.
@echo.
@rem NET UNUSE G:
@IF %LINK%==NONE                  ECHO. There is no link to remove
@IF %LINK%==NONE                  ECHO.
@IF %LINK%==NONE                  NET SHOW
@IF %LINK%==NONE                  ECHO.
@IF %LINK%==NONE                  GOTO :SKIPLINK
@IF exist k:\drive00a.cfg         ECHO. Disconnect %link%'s I:
@IF exist k:\drive00a.cfg         NET UNUSE I:
@IF exist k:\drive00b.cfg         ECHO. Disconnect %link%'s J:
@IF exist k:\drive00b.cfg         NET UNUSE J:
@IF exist k:\drive00d.cfg         ECHO. Disconnect %link%'s L:
@IF exist k:\drive00d.cfg         NET UNUSE L:
@IF exist k:\drive00e.cfg         ECHO. Disconnect %link%'s M:
@IF exist k:\drive00e.cfg         NET UNUSE M:
@IF exist k:\drive00f.cfg         ECHO. Disconnect %link%'s N:
@IF exist k:\drive00f.cfg         NET UNUSE N:
:LPTBEG
@echo.
@IF exist     c:\lpt00003.cfg     ECHO. Printer LPT3  is  LOCAL
@IF exist     c:\lpt00003.cfg     GOTO :COMBEG
@IF not exist g:\lpt00001.cfg     GOTO :COMBEG
@IF exist     k:\lpt00001.cfg     ECHO. Disconnect %link%'s LPT3
@IF exist     k:\lpt00001.cfg     NET UNUSE LPT3
@IF exist     g:\lpt00001.cfg     ECHO. Printer LPT3 is %serverid%'s LPT1
@IF exist     g:\lpt00001.cfg     NET USE LPT3 \\%serverid%\@PRINTER1
:COMBEG
@rem IF exist k:\com00001.cfg     NET UNUSE COM3
@rem IF exist k:\com00002.cfg     NET UNUSE COM4
@IF exist k:\lan\users\%link%\off.flg DEL k:\lan\users\%link%\OFF.flg
@IF exist k:\true.flg                 REN k:\lan\users\%link%\ON.flg OFF.flg
@echo.
@ECHO. Disconnect %link%'s K:
@NET UNUSE K:
@echo.
@IF not %link%==%serverid%        ECHO. Logout of system %link%
@IF not %link%==%serverid%        NET LOGOUT \\%link%
@echo.
@SET LINK=NONE
@rem echo.
@rem NET SHOW
@rem echo.
@CALL STAT
:SKIPLINK
@rem
