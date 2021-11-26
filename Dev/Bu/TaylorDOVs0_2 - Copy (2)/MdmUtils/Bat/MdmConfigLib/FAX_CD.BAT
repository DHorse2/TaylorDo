@Rem
@Echo Off
@Rem
@%OpSys.Drv%
@Call SetFax
@Cd %FaxDir%
@Echo.@
@Dir *.Bat /o:gne /p
@Echo.@
@Pause
@Dir *.Exe /o:gne /p
@Echo.@
@Pause
@Dir *.Qfx /o:gne /p
@Echo.@
@Pause
@Dir *.Rec /o:gne /p
@Echo.@
@Rem Pause
