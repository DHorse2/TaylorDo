@Rem
@Rem Echo Off
@Rem
@Echo. Format: DIRX [Directory] OutPutFile [/S /W]
@Echo.
@If exist c:\TempFile\%2.Rec Del c:\TempFile\%2.Rec
@Dir %1 /a:-d /o:en /b /l %3 %4 %5 %6 %7 > c:\TempFile\%2.Rec
@Call Q c:\TempFile\%2.Rec
@Dir c:\TempFile\%2.Rec
