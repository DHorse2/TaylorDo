@rem
:INIT
@rem PAUSE
@rem CLS
@PROMPT $b  $d  $b $t  $b  $v  $b  %sysid%  $b$_$b$p$g
@SET DIRCMD=/o:gen
@SET TEMP=c:\tempfile
@C:
@CD \
@PATH c:\;c:\dos;c:\bat
@rem @PATH %path%;c:\lantasti
@rem @PATH %path%;c:\winword;c:\windows
@rem @SET TEMP=c:\windows\temp
@rem @SET TEMP=d:\windows\temp
@rem @PATH %path%;c:\mouse
@rem @PATH %path%;c:\ut\opsys;c:\ut\macro
@rem @PATH %path%;c:\anywhere;c:\ql2fax
@rem
@CALL SETPATH
@CALL SETID
@CALL SYSID
@CALL SETSERVER
@CALL SETPROMPT
@CALL SETNATIVE
@CALL SETOPSYS
@rem
:MAIN
@rem
:LANSTART
@rem            * *  Network Area
@rem
@DEL c:\lan_on.flg
@DEL C:\Lan_stat.flg
@CALL LAN
@rem :LANOFF
@IF exist c:\lan_on.flg GOTO :LANEND
@ECHO.
@ECHO. The LAN is OFF
@ECHO.
@ECHO.  will use fastopen
@LOADHIGH c:\dos\FASTOPEN.EXE C:=255 /x
@ECHO.
@rem @PAUSE
:LANEND
@ECHO OFF
:CLOCKRTN
If not exist clklpt.flg GOTO :CLOCKEND
CLKLPT1
@ECHO.
:CLOCKEND
:MOUSERTN
IF not exist mouse.flg GOTO :MOUSEEND
@LOADHIGH c:\mouse\MOUSE
@ECHO.
:MOUSEEND
:FAXRTN
IF not exist fax.flg GOTO :FAXEND
CALL LOADFAX
@ECHO.
:FAXEND
:DOSKEYRTN
IF not exist doskey.flg GOTO :DOSKEYEND
DOSKEY
@ECHO.
:DOSKEYEND
:FAXES
@IF not exist \fax\in\*.* GOTO :FAXESEND
@ECHO.
@ECHO. There are faxes in \FAX\IN.
@ECHO.
@PAUSE
:FAXESEND
:MSGS
@IF not exist \msg\in\*.* GOTO :MSGSEND
@ECHO.
@ECHO. There are messages in \MSG\IN.
@ECHO.
@PAUSE
:MSGSEND
:OPSYS
IF %NATIVE%==DOS GOTO :OPSYSDOS
IF %NATIVE%==REV GOTO :OPSYSREV
IF %NATIVE%==PCK GOTO :OPSYSPCK
:OPSYSBAD
@GOTO :OPSYSEND
:OPSYSREV
@CALL REV
@GOTO :OPSYSEND
:OPSYSPCK
@CALL PICK /x
@GOTO :OPSYSEND
:OPSYSDOS
@C:
@CD \
@ECHO off
@rem PAUSE
@rem CLS
@CALL M
@GOTO :OPSYSEND
:OPSYSEND
