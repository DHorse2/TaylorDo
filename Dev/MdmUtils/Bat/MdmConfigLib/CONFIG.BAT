@REM
@ECHO OFF
@ECHO.
@ECHO.
@ECHO   You are now entering CONFIGURE MODE!!!
@ECHO.
@ECHO              WELCOME
@ECHO               to the
@ECHO           SYSTEM MANAGER
@ECHO.
@ECHO.
@ECHO enter EXIT_CONFIG to return to USER menu . . .
PAUSE
@ECHO.
@C:
@CD \BAT
@IF exist c:\config.off REN C:\CONFIG.OFF CONFIG.ON
@SETCONFIG.BAT
