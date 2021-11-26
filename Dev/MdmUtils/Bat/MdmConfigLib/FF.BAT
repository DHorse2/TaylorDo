@Rem
@Echo off
@Rem
@rem ECHO FF to %1
@rem PAUSE
@IF LPT1==%1 COPY \bat\FF.REC %1 > nul
@IF LPT2==%1 COPY \bat\FF.REC %1 > nul
@IF LPT3==%1 COPY \bat\FF.REC %1 > nul
@IF exist c:\%1true.flg COPY \bat\FF.REC PRN > nul
