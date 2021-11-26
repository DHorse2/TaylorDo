@Rem
@Echo OFF
@Rem
@If exist %OpSys.Drv%\%1True.Flg GoTo :LPTERR
@If exist %OpSys.Drv%\%2True.Flg GoTo :LPTERR
@Echo.@ Printer Spooler Job #%1 on LPT%2
@GoTo :LPTOK
@Rem
:LPTERR
@Echo.@
@Echo.@ Syntax: L [spooler.job.#] [dos.printer.#]
@Echo.@
@GoTo :LPTEND
@Rem
:LPTOK
@Rem %Sv.Drv%
@Rem Cd \Rec
@If not exist %Sv.Drv%\Rec\*.LPT Echo.@ There is nothing to print in %Sv.Drv%\Rec!
@If not exist %Sv.Drv%\Rec\*.LPT GoTo :LPTEND
@Dir %Sv.Drv%\Rec\*.LPT
@Echo.@
@Echo.@
@If not exist %Sv.Drv%\Rec\P%2j%1.LPT Echo.@  File %Sv.Drv%\Rec\P%2j%1.LPT does not exist!
@If not exist %Sv.Drv%\Rec\P%2j%1.LPT GoTo :LPTEND
@Copy %Sv.Drv%\Rec\P%2j%1.LPT LPT%2
@FF LPT%2
@Rem %OpSys.Drv%
@Rem
:LPTEND
@Echo.@
