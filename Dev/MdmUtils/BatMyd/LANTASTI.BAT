@ECHO off
@CALL SETPATH
@CALL SETID
@CALL SYSID
@CALL SETSERVER
@CALL SYS_STAT
@REM CALL SYS_STAT OK
@IF exist c:\lan_on.flg           GOTO :LANON
@IF exist c:\lan_no.flg           GOTO :LANOFF
@IF exist c:\lan_perm.flg         GOTO :LANSTART
@IF not exist c:\lan_on.flg       GOTO :LANPROMPT
:LANPROMPT
@ECHO off
@ECHO.
@ECHO.
@ECHO  Enter the network setting:
@ECHO.
@ECHO    {ctrl}+Z     to leave the network OFF.
@ECHO    ON{ctrl}+Z   to start the nextwork.
@ECHO.
@ECHO your response:
@DEL lan_on.flg
@COPY CON: c:\LAN_ON.FLG /b
@ECHO.
@IF not exist lan_on.flg          GOTO :LANOFF
:LANSTART
@COPY c:\lan_desc.doc+c:\start.flg /a c:\lan_stat.flg /a
@COPY c:\start.flg c:\lan_on.flg
@REM IF exist g:\true.flg SUBST G: /D
@CD c:\lantasti
@rem @PATH=c:\lantasti;%path%
@CALL SETPATH
@CALL c:\lantasti\STARTNET
@CALL c:\lantasti\LOGIN
REM @IF not %sysid%==SERVER1      CALL c:\lantasti\LINK SERVER1
REM @IF not %sysid%==PC1          CALL c:\lantasti\LINK PC1
IF %sysid%==%serverid%            GOTO :LANON
IF not %link%==%serverid%         CALL c:\lantasti\LINK %serverid%
:LANON
@CD \
@ECHO.
@ECHO               The LAN is ON
@ECHO.
@GOTO :LANEND
:LANOFF
@rem COPY c:\off.flg c:\lan_on.flg
@SUBST G: C:\
@ECHO.
@ECHO               The LAN is OFF
@ECHO        you should use FastOpen under DOS
@rem @LOADHIGH c:\dos\FASTOPEN.EXE C:=255 /x
@GOTO :LANEND
:LANEND
@ECHO.
@ECHO Network Flags, Verbs, Directories and Files:
@DIR \lan*.* /b /l
@IF not exist c:\lan_on.flg       CALL SYS_STAT
@IF exist c:\lan_on.flg           CALL LAN_STAT
@ECHO.
@ECHO Network Commands:
@ECHO LAN  LINK        LAN_STAT  SYS_STAT         NET_ON  NET_OFF  SETNET
@ECHO.
