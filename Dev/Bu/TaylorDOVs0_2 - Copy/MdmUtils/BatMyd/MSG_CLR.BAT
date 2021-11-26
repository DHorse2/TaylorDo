@rem
@echo OFF
:CLRBEGIN
@IF not exist \MSG\in\*.* GOTO :CLREND
DIR \MSG\IN\*.*
COPY \MSG\IN\*.* \MSG\OLD
DEL  \MSG\IN\*.*
:CLREND
@rem

