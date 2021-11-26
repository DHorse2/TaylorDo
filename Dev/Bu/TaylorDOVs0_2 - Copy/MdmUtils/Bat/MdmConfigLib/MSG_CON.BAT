@rem
@echo off
@G:
@cd g:\msg\in
:MSGIN
@IF not exist g:\msg\in\%1        GOTO :MSGOLD
@IF exist c:\%2true.flg           ECHO. MSG_LPT xxxMsgName.Extxxx LPTn
@IF exist c:\%2true.flg           GOTO :CLREND
@IF not exist g:\msg\in\%1        GOTO :CLREND
@DIR g:\msg\in\%1
@COPY g:\msg\in\%1 g:\msg\old
@ECHO  Printing Received Message 1% %2 %3 %4 %5 %6 %7 %8 %9
@CALL FF %2
@ECHO  ***  Received Message %1 %2  *** > %2
@COPY G:\msg\in\%1 %2
@rem G:\msg\in\PRINTMSG.EXE g:\msg\in\%1 24PIN.QLP /Q2 /L%2 /A
@DEL  g:\msg\in\%1
@GOTO :MSGEND
:MSGOLD
@IF not exist g:\msg\old\%1       GOTO :MSGERR
@ECHO  Printing Old Message %1 %2 %3 %4 %5 %6 %7 %8 %9
@CALL FF %2
@ECHO  ***  Old Message %1 %2  *** > %2
@COPY g:\msg\old\%1 %2
@rem G:\msg\in\PRINTMSG.EXE g:\msg\old\%1 %2 %3 %4 %5 %6 %7 %8 %9
@GOTO :MSGEND
:MSGERR
@ECHO      Msg %1 not found!!!
:MSGEND
@rem
@echo.
:CLRBEGIN
@IF not exist g:\msg\in\%1 GOTO :CLREND
@rem DIR g:\msg\in\%1
@COPY g:\msg\in\%1 g:\msg\old
@rem DEL  g:\msg\in\%1
:CLREND
@rem
@C:
@echo.
