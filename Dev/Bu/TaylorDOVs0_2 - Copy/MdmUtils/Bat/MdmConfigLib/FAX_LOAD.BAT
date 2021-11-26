@Rem
@Echo Off
@Rem
@Call SetFax
@Call Fax_On
@If exist %Opsys.Drv%%DirFax%    %CmdFax% %Opsys.Drv%%DirFax%
