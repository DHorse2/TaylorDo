@Rem
@Echo Off
@Rem
@Copy C:\TempFile\FindRslt.Txt C:\TempFile\FindRslt.Bak
@Del C:\TempFile\FindRslt.Txt
@For %%F in (%1) do FIND "%2" %%F /N >> C:\TempFile\FindRslt.Txt
@Call Q C:\TempFile\FindRslt.Txt
