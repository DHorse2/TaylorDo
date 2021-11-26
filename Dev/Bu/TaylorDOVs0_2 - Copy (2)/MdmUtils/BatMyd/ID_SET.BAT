@Rem
@Echo OFF
@If not exist c:\Bat\SetID%1.Dat Echo   (%1)  Invalid System ID Parameter!!!
@If     exist c:\Bat\SetID%1.Dat Set SysID=%1
@If not exist c:\Bat\SetID%1.Dat Set SysID=PC1
@Copy c:\Bat\SetID%SysID%.Dat c:\SetID.Bat
@Call c:\SetID
@Call c:\SetPROMPT
@Echo. The (SysID) System ID is now %SysID%.
