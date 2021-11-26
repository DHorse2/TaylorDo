@Rem
@Echo OFF
@Rem
@Cls
@Echo          Revelation
@C:
@Call SetOPSYS REV
@Call SetPROPMT
@Call SetPath
:FINDPath
@If not exist c:\Cable\Revg2b\Rev.Exe GoTo :NEWPath
@Path = c:\Cable;%Path%
@Cd \Cable\Revg2b
@GoTo :MAIN
:NEWPath
@If not exist c:\Rev\Cable\Revg2b\Rev.Exe GoTo :MAINEND
@Path = C:\Rev\Cable;%Path%
@Cd \Rev\Cable\Revg2b
:MAIN
@Rem CURSOR
CAPSLOCK
@Rem KEYBUFF
MEMFIX_G
@Echo ON
@Echo.
@If exist rev.Exe REV
@Echo OFF
:MAINEND
@C:
@Cd \
@Rem CURSOR
@Echo OFF
@Call SetOPSYS %native%
@Call SetPROMPT
M
