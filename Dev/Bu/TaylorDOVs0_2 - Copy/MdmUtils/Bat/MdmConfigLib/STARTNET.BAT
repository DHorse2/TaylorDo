@rem
@echo OFF
@COPY c:\init.flg c:\lan_on.flg
@CALL SETPATH
@rem PATH c:\lantasti;%path%
@CALL STAT
@rem LOADHIGH SHARE /L:200
@rem
@rem AEX IRQ=10 IOBASE=300 VERBOSE
@rem IF not %sysid%==SV1 AEX IRQ=15 IOBASE=300 VERBOSE
IF not %sysid%==SV1 AEX IRQ=15 IOBASE=340 VERBOSE
IF %sysid%==SV1 AEX IRQ=15 IOBASE=340 VERBOSE
IF not errorlevel 0 PAUSE
@rem
NR
LOADHIGH AILANBIO
IF not errorlevel 0 AILANBIO
IF not errorlevel 0 PAUSE
@rem
LOADHIGH REDIR %sysid% LOGINS=4
IF errorlevel 12 REDIR %sysid% LOGINS=4
IF not errorlevel 0 PAUSE
@rem
IF not exist c:\lancache.flg GOTO :CACHESKIP
LOADHIGH LANCACHE /TYPE=EMS /AFTER_IO_DELAY=5 /LONG_WRITE_DELAY=15
IF errorlevel 8 LANCACHE /TYPE=EMS /AFTER_IO_DELAY=5 /LONG_WRITE_DELAY=15
IF not errorlevel 0 PAUSE
:CACHESKIP
LOADHIGH SERVER
IF errorlevel 8 SERVER
IF not errorlevel 0 PAUSE
@rem
@COPY c:\runs.flg c:\lan_on.flg
@echo.  The Network is loaded
@COPY c:\lan_desc.doc+c:\runs.flg c:\lan_stat.flg
@rem PAUSE
@CALL STAT
