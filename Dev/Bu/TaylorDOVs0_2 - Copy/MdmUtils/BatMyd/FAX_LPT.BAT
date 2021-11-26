@Rem
@Echo off
@Rem
:FAXIN
@If not exist H:\Fax\In\%1        GoTo :FAXOLD
@If exist c:\%1True.Flg           Echo.@ FAX_LPT xxxfaxname.extxxx 9(=lpt?)
@If exist c:\%1True.Flg           GoTo :CLREND
@If exist c:\%2True.Flg           Echo.@ FAX_LPT xxxfaxname.extxxx 9(=lpt?)
@If exist c:\%2True.Flg           GoTo :CLREND
@If not exist H:\Fax\In\%1        Echo.@ %1 not found in H:\Fax\In
@If exist H:\Fax\Old\%1           Echo.@ %1 found in H:\Fax\Old
@If not exist H:\Fax\In\%1        GoTo :FAXOLD
@If not exist H:\Fax\In\%1        GoTo :CLREND
@H:
@Cd H:\Fax\In
@Dir H:\Fax\In\%1
@Copy H:\Fax\In\%1 H:\Fax\Old
@Echo.@  Printing Received Fax 1% 24PIN.QLP /Q2 /L2 /A %2 %3 %4 %5 %6 %7 %8 %9
@H:\Fax\In\PRINTFAX.EXE H:\Fax\In\%1 24PIN.QLP /Q2 /L2 /A %2 %3 %4 %5 %6 %7 %8 %9
@Del  H:\Fax\In\%1
@GoTo :FAXEND
:FAXOLD
@H:
@Cd H:\Fax\In
@If not exist H:\Fax\Old\%1       GoTo :FAXERR
@Echo.@  Printing Old Fax %1 24PIN.QLP /Q2 /L2 /A %2 %3 %4 %5 %6 %7 %8 %9
@H:\Fax\In\PRINTFAX.EXE H:\Fax\Old\%1 24PIN.QLP /Q2 /L2 /A %2 %3 %4 %5 %6 %7 %8 %9
@GoTo :FAXEND
:FAXERR
@Echo      Fax %1 not found!!!
:FAXEND
@Rem
@Echo.@
:CLRBEGIN
@If not exist H:\Fax\In\%1 GoTo :CLREND
@Rem Dir H:\Fax\In\%1
@Copy H:\Fax\In\%1 H:\Fax\Old
@Rem Del  H:\Fax\In\%1
:CLREND
@Rem
@%OpSys.Drv%
@Echo.@
