rem
@echo OFF
:MAIN
@IF CON==%1 GOTO :CONBANNER
@echo. > %1
@echo *********************** > %1
@echo *********************** > %1
@echo        %sysid% > %1
@echo *********************** > %1
@echo        %sysid% > %1
@DATE < \bat\enter.rec > %1
@echo        %sysid% > %1
@TIME < \bat\enter.rec > %1
@echo *********************** > %1
@echo *********************** > %1
@echo. > %1
@GOTO :MAINEND
:CONBANNER
@echo.
@echo ***********************
@echo ***********************
@echo        %sysid%
@echo ***********************
@echo        %sysid%
@DATE < \bat\enter.rec
@echo        %sysid%
@TIME < \bat\enter.rec
@echo ***********************
@echo ***********************
@echo.
:MAINEND
@rem
