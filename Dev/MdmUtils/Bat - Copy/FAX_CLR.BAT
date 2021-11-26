@Rem
@Echo Off
:CLRBEGIN
@If not exist \Fax\In\*.Rec GoTo :CLREND
@Dir \Fax\In\*.Rec
@Copy \Fax\In\*.Rec \Fax\Old
@Del  \Fax\In\*.Rec
:CLREND
@Rem
