@Rem
@Echo OFF
@Rem
@Echo.@
@Call MSG_CHK
@Echo.@
@If not exist %OpSys.Drv%\%1True.Flg       GoTo :MSGBEG
@Echo.@
@Echo.@  Format:   MSG_SND system.id
@Echo.@
@GoTo :MSGEND
@rem
:MSGBEG
@Echo.@ Enter message lines then Ctrl_Z to send.
@Echo.@ ___________________________________________________
@Copy CON: %OpSys.Drv%\Msg\Out\LAST.Msg
@Echo.@ ___________________________________________________
@Echo.@ ************ E N D ************ >>     %OpSys.Drv%\Msg\Out\LAST.Msg
@Echo.@ *******  M E S S A G E  ******* >      %OpSys.Drv%\Msg\Out\Tmp.Doc
@Echo.@ *          TO:  %1           *  >>     %OpSys.Drv%\Msg\Out\Tmp.Doc
@Echo.@ *                             * >>     %OpSys.Drv%\Msg\Out\Tmp.Doc
@Echo.@ * The message was sent by %sysid% * >> %OpSys.Drv%\Msg\Out\Tmp.Doc
@Echo.@ *                             * >>     %OpSys.Drv%\Msg\Out\Tmp.Doc
@Echo.@ *                             * >>     %OpSys.Drv%\Msg\Out\Tmp.Doc
@Copy %OpSys.Drv%\Msg\Out\Tmp.Doc+%OpSys.Drv%\Msg\Out\LAST.Msg   %OpSys.Drv%\Msg\Out\%1.Msg
@rem
:LAN
@If not exist %OpSys.Drv%\lan_on.Flg GoTo :LANSKIP
@If not %link%==%1          GoTo :LANSKIP
@Echo.@
@Echo.@     moving message to destination machine
@Echo.@
Copy %OpSys.Drv%\Msg\Out\%1.Msg                %Sv.Drv%\Msg\In\%SYSID%.Msg
@Call Move %OpSys.Drv%\Msg\Out\%1.Msg          %OpSys.Drv%\Msg\Old\%1.Msg
@Echo.@
@Echo.@      check If any messages are waiting
@Echo.@
@If not exist %Sv.Drv%\Msg\Out\%SYSID%.Msg      GoTo :LANEND
Copy %Sv.Drv%\Msg\Out\%SYSID%.Msg               %OpSys.Drv%\Msg\In
@Call Move %Sv.Drv%\Msg\Out\%SYSID%.Msg         %Sv.Drv%\Msg\Old
@Echo.@
@Call MSG_CHK
@Echo.@
@GoTo :LANEND
:LANSKIP
@Echo.@
@Echo.@
@Echo.@  The message for %1 has been saved until the next link.
:LANEND
@Echo.@ OFF
@Echo.@
@Echo.@  The message for %1 reads as follows:
@Echo.@ ___________________________________________________
@If not exist %OpSys.Drv%\Msg\Out\%1.Msg       GoTo :MSGSENT
@More < %OpSys.Drv%\Msg\Out\%1.Msg
@If %sysid%==%1 Call Move %OpSys.Drv%\Msg\Out\%1.Msg %OpSys.Drv%\Msg\In
@GoTo MSGEND
:MSGSENT
@More < %OpSys.Drv%\Msg\Old\%1.Msg
:MSGEND
@Echo.@ ___________________________________________________
@Echo.@
