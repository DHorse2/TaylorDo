@Rem
@Echo OFF
@Rem
@Rem Branch to configure menu when config on
@If exist %OpSys.Drv%\config.on SETCONFIG
@Call SETPATH
@Call SETPROMPT
@Rem CALL STAT OK
@Rem CD \
@Call FAX_CHK
@Call MSG_CHK
@Type \GETBACK.DAT
@Echo Enter one of the above commands.
