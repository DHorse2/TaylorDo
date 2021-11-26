@Echo OFF
@Rem
@Cls
@Echo.
@Echo.         K-bil by Axion
@Echo.            REV BOOT
:DRVSTART
@Echo.
@Echo. LOCAL or SERVER
Set OpSys.Drv=C:
:DRVFIND
@Echo. check drive %OpSys.Drv%...
%OpSys.Drv%
@Rem The following flag means REV is off (not present)
@Rem                      Or Use the server for REV
@If     exist %OpSys.Drv%\Rev_off.flg             GoTo DRVCHNG
@If not exist %OpSys.Drv%\Rev.flg                 GoTo DRVCHNG
@Echo.
@Echo. Use REV @If it exists
@If exist %OpSys.Drv%\OpSys\Rev\RevG\Curr\Rev.Exe GoTo DRVOK
@If exist %OpSys.Drv%\Cable\RevG2B\Rev.Exe        GoTo DRVOK
:DRVCHNG
@Echo.
@Echo.     REV is not present on drive %OpSys.Drv%!
@If %OpSys.Drv%==N:                 Echo. REV is not available!!!
@If %OpSys.Drv%==N:                 Pause
@If %OpSys.Drv%==N:                 GoTo DRVEND
@If %OpSys.Drv%==M:                 Set OpSys.Drv=N:
@If %OpSys.Drv%==H:                 Set OpSys.Drv=M:
@If %OpSys.Drv%==D:                 Set OpSys.Drv=H:
@If %OpSys.Drv%==C:                 Set OpSys.Drv=D:
@If %OpSys.Drv%==H:                 Echo.     Use the Server (H:) for REV
@If %OpSys.Drv%==M:                 Echo.     Use the   Link (M:) for REV
@Echo.     Will now try Drive %OpSys.Drv%...
@Echo.
@If exist %OpSys.Drv%\Debug.Flg     Pause
@GoTo DRVFIND
:DRVOK
@Echo.
@Pause
@Echo.
@Call SetOpSys REV
@Rem
@Rem Set the Path to either %OpSys.Drv%\OpSys\Rev\RevG\Curr (new) or %OpSys.Drv%\Cable (old)
@Call SetPath
@If exist %OpSys.Drv%\OpSys\Rev\RevG\Curr\Rev.Exe Cd %OpSys.Drv%\OpSys\Rev\RevG\Curr
@If exist %OpSys.Drv%\OpSys\Rev\RevG\Curr\Rev.Exe Path=%OpSys.Drv%\OpSys\Rev\RevG\Curr;%OpSys.Drv%\OpSys\Rev\RevG;%Path%
@If exist %OpSys.Drv%\Cable\RevG2B\Rev.Exe        Cd %OpSys.Drv%\Cable
@If exist %OpSys.Drv%\Cable\RevG2B\Rev.Exe        Path=%OpSys.Drv%\Cable;%OpSys.Drv%\Cable\RevG2B;%Path%
@If exist capslock.com                            CAPSLOCK
@Cd RevG2B
@Path
@Rem
@Rem Set Modes, Generic, Cursor, and Fix memory
@Rem
@Copy  %OpSys.Drv%\KBil%1.Dat    %OpSys.Drv%\KBilMode.Dat
@If exist generic.Dat            Del GENERIC.Dat
@If exist cursor.com             CURSOR
@If exist memfix_g.Exe           MEMFIX_G
@Rem
@Rem Run Revelation
@Rem
@Echo ON
REV CABLE
@If exist  %OpSys.Drv%\Debug.Flg     Echo. DEBUG is ON!!!
@If exist  %OpSys.Drv%\Debug.Flg     Pause
@Rem
@Rem Clean up flags and run menu
@Rem
@If exist  %OpSys.Drv%\KBilMode.Dat  Del  %OpSys.Drv%\KBilMode.Dat
:DRVEND
@Call SetDrv
@%OpSys.Drv%
@Cd \
@If exist cursor.com             CURSOR
@Echo OFF
@Cls
M
