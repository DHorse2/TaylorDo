@rem
@echo OFF
:MOVEBEGIN
@IF not exist M:\True.Flg GOTO MOVEEND
@Rem
@Echo Off
@Rem
@If not exist C:\Fax\In\*.Rec    GoTo :MOVEEND
@Dir C:\Fax\In\*.Rec
@Copy C:\Fax\In\*.Rec M:\Fax\In
:MOVEEND
@Rem
