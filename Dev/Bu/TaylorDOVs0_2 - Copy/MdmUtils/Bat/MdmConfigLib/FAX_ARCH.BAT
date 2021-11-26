@Rem
@Echo Off
@Rem
:ARCBEGIN
@If     exist c:\%1True.Flg GoTo :ARCERR
@Copy c:\True.Flg %1\
@If     exist %1\True.Flg   GoTo :ARCCONT
:ARCERR
@Echo.@
@Echo.@ You must specify a destination drive (A: B: H:...)
@Rem Pause
@GoTo :ARCEND
:ARCCONT
@Rem pause
@Echo ON
@If not exist \Fax\Old\*.Rec Echo.@ There are no faxes To Archive!
@If not exist \Fax\Old\*.Rec GoTo :ARCEND
@Dir \Fax\Old\*.Rec
@Md %1\Fax
@Md %1\Fax\Arc
@Copy \Fax\Old\*.Rec %1\Fax\Arc
@Dir %1\Fax\Arc\*.Rec
@If not exist %1\Fax\Arc\*.Rec GoTo :ARCEND
@Del  \Fax\Old\*.Rec
:ARCEND
@Rem
