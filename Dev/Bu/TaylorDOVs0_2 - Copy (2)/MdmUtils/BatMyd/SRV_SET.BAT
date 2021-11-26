@Rem
@Echo OFF
@If not exist c:\Bat\SetSI%1.Dat Echo   (%1)  Invalid System ID Parameter!!!
@If     exist c:\Bat\SetSI%1.Dat Set ServerID=%1
@If not exist c:\Bat\SetSI%1.Dat Set ServerID=SV1
@Copy c:\Bat\SetSI%ServerID%.Dat c:\SetServer.Bat
@Call c:\SetServer
@Call c:\SetPROMPT
@Echo. The (ServerID) System ID is now %ServerID%.
