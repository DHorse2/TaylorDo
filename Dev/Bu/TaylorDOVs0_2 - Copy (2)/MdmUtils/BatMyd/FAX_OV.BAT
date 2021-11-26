@Rem
@Echo Off
@H:
@Rem CD \com\Ql2Fax
@Cd \fax\in
@Rem
@Rem Ql2Fax=H:\fax\in
@Set QlL2Fax=H:\fax\in
@Rem
@Rem Path = H:\com\Ql2Fax;%Path%
@Path = H:\fax\in;%Path%
@Rem
@Rem Call H:\com\Ql2Fax\Ql2Fax
@Call H:\fax\in\NITEFAX
@Rem
@%OpSys.Drv%
@Rem M
