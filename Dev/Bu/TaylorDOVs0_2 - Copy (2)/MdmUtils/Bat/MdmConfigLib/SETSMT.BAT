@Rem
@Echo Off
@Rem
@If not exist c:\win.flg Set DirSmt=\Dos\SmartDrv.Exe
@If     exist c:\win.flg Set DirSmt=\Windows\SmartDrv.Exe
@Set CmdSmt=
@Rem LoadHigh
@Set SmtMax= 4096
@Set SmtMin= 2048
@Set SmtM= /N /E:8192 /B:32768 /V
@Rem Set SmtM=AC+ 4096 4096
@Rem /S /V 4096 4096
@Rem Set SmtM=/x
@Rem Set SmtM=/a
