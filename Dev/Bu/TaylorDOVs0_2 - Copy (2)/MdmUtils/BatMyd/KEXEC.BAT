@Echo OFF
@Rem
@Cls
@Rem -------------------------------------------
@Echo.
@Echo.            K-bil by Axion
@Echo.            REVelation BOOT
@Rem -------------------------------------------
:DRVSTART
@Echo.
@Echo. LOCAL or SERVER
Set OpSys.Drv=C:
@Rem -------------------------------------------
:DRVFIND
@Echo. Check drive %OpSys.Drv% for REV...
%OpSys.Drv%
@Rem The following flag means REV is off (not present)
@Rem                      Or Use the server for REV
@If     exist %OpSys.Drv%\Rev_Off.Flg             GoTo DRVCHNG
@If not exist %OpSys.Drv%\Rev.Flg                 GoTo DRVCHNG
@Echo.
@Echo. Use REV if it exists
@If exist %OpSys.Drv%\OpSys\Rev\RevG\Curr\Rev.Exe GoTo DRVOK
@If exist %OpSys.Drv%\Cable\RevG2B\Rev.Exe        GoTo DRVOK
@Rem -------------------------------------------
:DRVCHNG
@Echo.
@Echo.     REV is not present on drive %OpSys.Drv%!
@If %OpSys.Drv%==N:                 Echo. REV is not available!!!
@If %OpSys.Drv%==N:                 Pause
@If %OpSys.Drv%==N:                 GoTo DRVEND
@If %OpSys.Drv%==M:                 Set OpSys.Drv=N:
@If %OpSys.Drv%==N:                 Echo.     Try the Link\D: (N:) for REV
@If %OpSys.Drv%==H:                 Set OpSys.Drv=M:
@If %OpSys.Drv%==M:                 Echo.     Try the Link\C: (M:) for REV
@If %OpSys.Drv%==D:                 Set OpSys.Drv=H:
@If %OpSys.Drv%==H:                 Echo.     Try the Server\ (H:) for REV
@If %OpSys.Drv%==C:                 Set OpSys.Drv=D:
@If %OpSys.Drv%==D:                 Echo.     Try Local Drive (D:) for REV
@Echo.     Will now try Drive %OpSys.Drv%...
@Echo.
@If exist %OpSys.Drv%\Debug.Flg     Pause
@GoTo DRVFIND
@Rem -------------------------------------------
:DRVOK
@Echo. REVelation found on drive %OpSys.Drv%
@Cd
@If exist %OpSys.Drv%\Debug.Flg     Pause
@Echo.
@Call SetOpSys REV
@Rem
@Rem -------------------------------------------
@Rem Set the Path to either %OpSys.Drv%\OpSys\Rev\RevG\Curr (new) or %OpSys.Drv%\Cable (old)
@Rem
@Call SetPath
@If exist %OpSys.Drv%\OpSys\Rev\RevG\Curr\Rev.Exe Cd %OpSys.Drv%\OpSys\Rev\RevG\Curr
@If exist %OpSys.Drv%\OpSys\Rev\RevG\Curr\Rev.Exe Path=%OpSys.Drv%\OpSys\Rev\RevG\Curr;%OpSys.Drv%\OpSys\Rev\RevG;%Path%
@If exist %OpSys.Drv%\Cable\RevG2B\Rev.Exe        Cd %OpSys.Drv%\Cable
@If exist %OpSys.Drv%\Cable\RevG2B\Rev.Exe        Path=%OpSys.Drv%\Cable;%OpSys.Drv%\Cable\RevG2B;%Path%
@Rem
@Rem Set Cursor, Capslock, Numlock if in \Cable
@Rem
@If exist cursor.com             CURSOR
@If exist capslock.com           CAPSLOCK
@Rem
@Rem Move out to \RevG2B if in present
@Rem
@Cd RevG2B
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
@Copy %OpSys.Drv%\KBil%1.SCd     %Opsys.Drv%\KBilSyst.Dat
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
@Rem Run TSR's and Rev MemFix_G patch
@Rem
@If exist memfix_g.Exe           MEMFIX_G
@Rem -------------------------------------------
@Rem
@Rem Run Revelation
@Rem
@Echo ON
REV CABLE
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
