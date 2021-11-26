@rem
@echo.
@IF not exist c:\%1true.flg       GOTO :MSGBEG
@echo.
@echo.  Format:   MSG_SND system.id
@echo.
@GOTO :MSGEND
@rem
:MSGBEG
@echo.
@echo Enter message lines then Ctrl_Z to send.
@echo ___________________________________________________
@COPY CON: C:\msg\out\LAST.msg
@echo ___________________________________________________
@ECHO ************ E N D ************ >>     C:\msg\out\LAST.msg
@ECHO *******  M E S S A G E  ******* >      C:\msg\out\TMP.doc
@ECHO *          TO:  %1           * >>     C:\msg\out\TMP.doc
@ECHO *                             * >>     C:\msg\out\TMP.doc
@ECHO * The message was sent by %sysid% * >> C:\msg\out\TMP.doc
@ECHO *                             * >>     C:\msg\out\TMP.doc
@ECHO *                             * >>     C:\msg\out\TMP.doc
@COPY C:\msg\out\TMP.doc+C:\msg\out\LAST.msg C:\msg\out\%1.msg
@rem
:LAN
@IF not exist c:\lan_on.flg       GOTO :LANSKIP
@IF not %link%==%1                GOTO :LANSKIP
@echo.
@echo     moving message to destination machine
@echo.
COPY C:\msg\out\%1.msg            K:\msg\in\%SYSID%.msg
@CALL MOVE C:\msg\out\%1.msg      C:\msg\old\%1.msg
@echo.
@echo      check if any messages are waiting
@echo.
@IF not exist K:\msg\out\%SYSID%.msg   GOTO :LANEND
COPY K:\msg\out\%SYSID%.msg       C:\MSG\IN
@CALL MOVE K:\msg\out\%SYSID%.msg K:\msg\old
@echo.
@CALL MSG_CHK
@echo.
@GOTO :LANEND
:LANSKIP
@echo.
@echo.
@echo  The message for %1 has been saved until the next link.
:LANEND
@echo OFF
@echo.
@echo  The message for %1 reads as follows:
@echo ___________________________________________________
@IF not exist C:\msg\out\%1.msg   GOTO :MSGSENT
@MORE < C:\msg\out\%1.msg
@IF %sysid%==%1                   CALL MOVE C:\msg\out\%1.msg C:\msg\in
@GOTO MSGEND
:MSGSENT
@MORE < C:\msg\old\%1.msg
:MSGEND
@echo ___________________________________________________
@echo.
