@Rem
@Echo Off
@H:
@Rem CD \Com\Ql2Fax
@Cd \Fax\In
@Rem
@Set QL2FAX=H:\Fax\In
@Rem SET QL2FAX=H:\Fax\In
@Rem
@Rem Path = H:\Com\Ql2Fax;%Path%
@Path = H:\Fax\In;%Path%
@Rem
@Rem Call H:\Com\Ql2Fax\Ql2Fax
@Call H:\Fax\In\SNDFAX.BAT
@%OpSys.Drv%
@Rem M
