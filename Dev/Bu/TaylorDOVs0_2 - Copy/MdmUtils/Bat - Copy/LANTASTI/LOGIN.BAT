@rem
@rem echo OFF
@echo ON
@echo.
@echo. set path
@rem PATH c:\lantasti;%path%
@CALL SETPATH
@echo. load SHARE if not present
@rem  ---------------------
:SHAREIT
@IF not exist c:\share.flg        GOTO :SHAREITEND
@rem
@CALL SETSHARE
@IF not exist c:%dirshr%          GOTO :SHAREITEND
@rem LOADHIGH c:\dos\SHARE.EXE /f:2048 /l:255
@%cmdshr% c:%dirshr% %shrf% %shrl%
@echo OFF
@echo.
:SHAREITEND
@echo.
@echo. LOGIN to my system
@rem
NET LOGIN/WAIT \\%sysid% %sysid%
@echo.
@echo. System & Printer Management
@rem
:SYS
@echo.
@echo. LINK to SERVERn
@echo.
@IF %link%==%serverid%         NET SHOW
@IF %link%==%serverid%         GOTO :LINKSKIP
:LINK
IF not %sysid%==%serverid%        CALL LINK %serverid%
@echo.
NET USE G: \\%serverid%\C-DRIVE
@IF exist G:\drive00c.cfg ECHO. Drive  G:  is  %serverid%'s  C:
@echo.
:LINKSKIP
IF %sysid%==%serverid%            GOTO :SYSLOC
@rem
:SYSREM
@G:
@echo.
@echo. Set Up Server Resources on Server
@echo.
@IF exist g:\lan\users\%serverid%.            DEL g:\lan\users\%serverid%. > nul
@IF not exist g:\lan\users\%serverid%\*.cfg   MD g:\lan\users\%serverid% > nul
@DEL g:\lan\users\%serverid%\*.cfg > nul
@COPY g:\*.cfg g:\lan\users\%serverid%\*.cfg > nul
@echo.
@IF not exist g:\lpt00001.cfg     ECHO. Printer LPT1 not on %serverid% (SKIP LPT2)
@IF not exist g:\lpt00001.cfg     GOTO :SYSREMEND
@echo.
@echo. Link to server printers
@echo.
@IF exist c:\lpt00002.cfg         ECHO. Printer  LPT2  is  LOCAL (SKIP LPT2)
@IF exist c:\lpt00002.cfg         GOTO :SYSREMEND
@IF exist g:\lpt00001.cfg         NET USE LPT2 \\%serverid%\@PRINTER1
@IF exist g:\lpt00001.cfg         ECHO. Printer  LPT2  is  %serverid%'s  LPT1
@rem IF not exist c:\lpt00001.cfg NET USE LPT1 \\%serverid%\@PRINTER1
GOTO :SYSEND
@rem
:SYSREMEND
@rem
@CALL STAT
@rem
:SYSLOC
@rem
@rem NO Server System Present or it is Me
@c:
@echo.
@echo Set Up Local Resources
@echo.
:SYSLPT1
@IF not exist c:\lpt00001.cfg GOTO SYSLPT2
@IF exist c:\lpt00001.cfg     NET USE LPT1 \\%sysid%\@PRINTER1
@IF exist c:\lpt00001.cfg     ECHO. Printer  LPT1  is  %sysid%'s  LPT1
:SYSLPT2
@echo.
@IF exist c:\lpt00002.cfg     NET USE LPT2 \\%sysid%\@PRINTER2
@IF exist c:\lpt00002.cfg     ECHO. Printer  LPT2  is  %sysid%'s  LPT2
@echo.
@IF not exist c:\lpt00001.cfg GOTO SYSLPT3
@IF not exist c:\lpt00002.cfg NET USE LPT2 \\%sysid%\@PRINTER1
@IF not exist c:\lpt00002.cfg ECHO. Printer  LPT2  is  %sysid%'s  LPT1
:SYSLPT3
@echo.
@IF exist c:\lpt00003.cfg     NET USE LPT3 \\%sysid%\@PRINTER3
@IF exist c:\lpt00003.cfg     ECHO. Printer  LPT3  is  %sysid%'s  LPT3
@echo.
@IF not exist c:\lpt00001.cfg GOTO SYSLPTEND
@IF not exist c:\lpt00003.cfg NET USE LPT3 \\%sysid%\@PRINTER1
@IF not exist c:\lpt00003.cfg ECHO. Printer  LPT3  is  %sysid%'s  LPT1
:SYSLPTEND
@echo.
:SYSEND
@echo.
NET LPT TIMEOUT 2
@echo.
@echo Disk Management
@echo.
@IF exist c:\lan\users\%sysid%.             DEL g:\lan\users\%sysid%. > nul
@echo.
@IF not exist c:\lan\users\%sysid%\*.cfg    MD c:\lan\users\%sysid% > nul
@echo.
@DEL c:\lan\users\%sysid%\*.cfg > nul
@echo.
@COPY c:\*.cfg c:\lan\users\%sysid% > nul
@echo.
:SKIPFLGS
@DIR c:\lan\users\%sysid%
@echo.
