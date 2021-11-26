@IF not exist C:\%1TRUE.FLG SET NATIVE=%1
@IF exist C:\%1TRUE.FLG SET NATIVE=%opsys%
@COPY \BAT\SET%NATIVE%.DAT \SETNATIVE.BAT
@ECHO. The native Operating system is now %NATIVE%.
