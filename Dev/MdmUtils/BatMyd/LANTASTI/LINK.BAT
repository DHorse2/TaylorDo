@rem
@rem ECHO OFF
@rem
@echo.
@echo. LOGIN %1 %sysid%
@IF %LINK%==%1                    ECHO. Link from to %1 is already established!
@IF %LINK%==%1                    GOTO :LINKSKIP
NET LOGIN/WAIT \\%1 %sysid%
@IF exist k:\drive00c.cfg         ECHO. %sysid% Logged in to %1
@echo.
@IF exist k:\drive00c.cfg         ECHO. Drive  K:  is  %1's  C:
NET USE K: \\%1\C-DRIVE
@IF exist k:\true.flg             MD k:\lan\users\%sysid%
@IF exist k:\true.flg             COPY C:\*.cfg k:\lan\users\%sysid%
@IF exist k:\true.flg             COPY C:\SYSID.flg k:\lan\users\%sysid%\ON.flg
@IF exist k:\lan\users\%sysid%\OFF.flg  DEL k:\lan\users\%sysid%\OFF.flg
:COPYSKIP
@IF exist k:\drive00a.cfg         ECHO. Drive  I:  is  %1's  A:
@IF exist k:\drive00a.cfg         NET USE I: \\%1\A-DRIVE
@IF exist k:\drive00b.cfg         ECHO. Drive  J:  is  %1's  B:
@IF exist k:\drive00b.cfg         NET USE J: \\%1\B-DRIVE
@IF exist k:\drive00d.cfg         ECHO. Drive  L:  is  %1's  D:
@IF exist k:\drive00d.cfg         NET USE L: \\%1\D-DRIVE
@IF exist k:\drive00e.cfg         ECHO. Drive  M:  is  %1's  E:
@IF exist k:\drive00e.cfg         NET USE M: \\%1\E-DRIVE
@IF exist k:\drive00f.cfg         ECHO. Drive  N:  is  %1's  F:
@IF exist k:\drive00f.cfg         NET USE N: \\%1\F-DRIVE
:LPTBEG
@IF exist     c:\lpt00001.cfg     ECHO. Printer LPT1 is LOCAL
@IF exist     c:\lpt00002.cfg     ECHO. Printer LPT2 is LOCAL
:LPTTHREE
@IF not exist k:\lpt00001.cfg     ECHO. Printer LPT1 not on %1 (SKIP LPT3)
@IF not exist k:\lpt00001.cfg     GOTO :LPTEND
@IF exist     c:\lpt00003.cfg     ECHO. Printer LPT3 is LOCAL  (SKIP LPT3)
@IF exist     c:\lpt00003.cfg     GOTO :LPTEND
@IF not exist k:\lpt00001.cfg     ECHO. Printer LPT1 not on %1 (SKIP LPT3)
@IF not exist k:\lpt00001.cfg     GOTO :LPTEND
@IF exist     c:\lpt00001.cfg     ECHO. Disconnect LPT3
@IF exist     c:\lpt00001.cfg     NET UNUSE LPT3
@IF exist     k:\lpt00001.cfg     ECHO. Printer  LPT3  is  %1's  LPT1
@IF exist     k:\lpt00001.cfg     NET USE LPT3 \\%1\@PRINTER1
@rem IF not exist c:\lpt00001.cfg NET USE LPT1 \\%1\@PRINTER1
:LPTEND
@rem
:COMONE
@IF exist c:\com00001.cfg         GOTO :COMTWO
@IF exist k:\com00001.cfg         ECHO. CommPort  COM1  is  %1's  COM1
@IF exist k:\com00001.cfg         NET USE COM1 \\%1\@COM1
:COMTWO
@IF exist c:\com00002.cfg         GOTO :COMEND
@IF exist k:\com00002.cfg         ECHO. CommPort  COM2  is  %1's  COM2
@IF exist k:\com00002.cfg         NET USE COM2 \\%1\@COM2
:COMEND
@echo.
@SET LINK=%1
@rem echo.
@rem NET SHOW
@rem echo.
@K:
@CALL STAT
@C:
@CALL STAT
:LINKSKIP
@echo.
