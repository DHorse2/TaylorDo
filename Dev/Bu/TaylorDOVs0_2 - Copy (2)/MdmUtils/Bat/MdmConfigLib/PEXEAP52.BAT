@Echo OFF
@Rem
@Cls
@Rem -------------------------------------------
@Echo.
@Echo.            K-bil by Axion
@Echo.               PICK BOOT
@Rem -------------------------------------------
:DRVSTART
@Echo.
@Echo. LOCAL or SERVER
Set OpSys.Drv=C:
@Rem -------------------------------------------
:DRVFIND
@Echo. Check drive %OpSys.Drv% for PICK...
%OpSys.Drv%
@Rem The following flag means PICK is off (not present)
@Rem                      Or Use the server for PICK
@If     exist %OpSys.Drv%\Pck_Off.Flg             GoTo DRVCHNG
@If not exist %OpSys.Drv%\Pck.Flg                 GoTo DRVCHNG
@Echo.
@Echo. Use PICK if it exists
@If exist %OpSys.Drv%\OpSys\Pick\APDos\Curr\PickMon.Exe GoTo DRVOK
@If exist %OpSys.Drv%\Pick\PickMon.Exe        GoTo DRVOK
@Rem -------------------------------------------
:DRVCHNG
@Echo.
@Echo.     PICK is not present on drive %OpSys.Drv%!
@If %OpSys.Drv%==N:                 Echo. PICK is not available!!!
@If %OpSys.Drv%==N:                 Pause
@If %OpSys.Drv%==N:                 GoTo DRVEND
@If %OpSys.Drv%==M:                 Set OpSys.Drv=N:
@If %OpSys.Drv%==N:                 Echo.     Try the Link\D: (N:) for PICK
@If %OpSys.Drv%==H:                 Set OpSys.Drv=M:
@If %OpSys.Drv%==M:                 Echo.     Try the Link\C: (M:) for PICK
@If %OpSys.Drv%==D:                 Set OpSys.Drv=H:
@If %OpSys.Drv%==H:                 Echo.     Try the Server\ (H:) for PICK
@If %OpSys.Drv%==C:                 Set OpSys.Drv=D:
@If %OpSys.Drv%==D:                 Echo.     Try Local Drive (D:) for PICK
@Echo.     Will now try Drive %OpSys.Drv%...
@Echo.
@If exist %OpSys.Drv%\Debug.Flg     Pause
@GoTo DRVFIND
@Rem -------------------------------------------
:DRVOK
@Echo. PICK found on drive %OpSys.Drv%
@Echo.
@Rem Cd
@If exist %OpSys.Drv%\Debug.Flg     Pause
@Echo.
@Call SetOpSys PCK
@Rem
@Rem -------------------------------------------
@Rem Set the Path to either %OpSys.Drv%\OpSys\Pick\APDos\Curr (new) or %OpSys.Drv%\Pick (old)
@Rem
@Call SetPath
@If exist %OpSys.Drv%\OpSys\Pick\APDos\Curr\PickMon.Exe Cd %OpSys.Drv%\OpSys\Pick\APDos\Curr
@If exist %OpSys.Drv%\OpSys\Pick\APDos\Curr\PickMon.Exe Path=%OpSys.Drv%\OpSys\Pick\APDos\Curr;%OpSys.Drv%\OpSys\Pick\APDos;%Path%
@If exist %OpSys.Drv%\Pick\PickMon.Exe        Cd %OpSys.Drv%\Pick
@If exist %OpSys.Drv%\Pick\PickMon.Exe        Path=%OpSys.Drv%\Pick;%OpSys.Drv%\Pick;%Path%
@Rem
@Rem Set Cursor, Capslock, Numlock if in \Pick
@Rem
@If exist cursor.com             CURSOR
@If exist capslock.com           CAPSLOCK
@Path
@Rem
@Rem -------------------------------------------
@Rem Set Modes, Generic, Cursor, and Fix memory.
@Rem -------------------------------------------
@Rem
@Rem Set Mode,  LIVE data, CUSTomer support, DEVelopement, DEMOnstration.
@Rem
@Copy %OpSys.Drv%\KBil%1.Mod     %OpSys.Drv%\KBilMode.Dat
@Rem -------------------------------------------
@Rem
@Rem Set Current Data Directory Pointer.
@Rem
@Copy %OpSys.Drv%\KBil%2.SCd     %Opsys.Drv%\KBilSyst.Dat
@Rem -------------------------------------------
@Rem
@Rem Turn off Generic flag.
@Rem
@If exist generic.Dat            Del GENERIC.Dat
@Rem -------------------------------------------
@Rem
@Rem Set Cursor, Capslock, Numlock
@Rem
@If exist cursor.com             CURSOR
@If exist capslock.com           CAPSLOCK
@Rem -------------------------------------------
@Rem
@Rem Run TSR's and Flush Disk Cache
@Rem
@Call Flush
@Rem -------------------------------------------
@Rem
@Rem Run Advanced Pick for Dos
@Rem
@Echo ON
@PICKMON.EXE /X X
@Rem
@Rem -------------------------------------------
@If exist  %OpSys.Drv%\Debug.Flg     Echo. DEBUG is ON!!!
@If exist  %OpSys.Drv%\Debug.Flg     Pause
@Rem -------------------------------------------
@Rem
@Rem Clean up flags and run menu
@Rem
@If exist  %OpSys.Drv%\KBilMode.Dat  Del  %OpSys.Drv%\KBilMode.Dat
@Rem -------------------------------------------
:DRVEND
@Call SetDrv
@%OpSys.Drv%
@Cd \
@If exist cursor.com             CURSOR
@Echo OFF
@Cls
M
