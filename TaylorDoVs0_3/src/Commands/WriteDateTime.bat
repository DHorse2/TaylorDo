@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo WriteDateTime Seamonkey's quick date batch (MMDDYYYY format)
@Echo ------------------------------------------------------
@@Rem Set ups %date variable
@@Rem First parses month, day, and year into mm , dd, yyyy formats and then combines to be MMDDYYYY

@FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE /T') DO SET CDATE=%%A
@Rem Echo Cdate%CDATE%
@FOR /F "TOKENS=2,3 eol=/ DELIMS=/-" %%A IN ('echo %CDATE%') DO SET mm=%%A
@Rem Echo m%mm%
@FOR /F "TOKENS=3,4 eol=/ DELIMS=/-" %%A IN ('echo %CDATE%') DO SET dd=%%A
@Rem Echo d%dd%
@FOR /F "TOKENS=1,2 DELIMS=/-" %%A IN ('echo %CDATE%') DO SET yyyy=%%A
@Rem Echo y%yyyy%

@Rem SET mydate=%yyyy%%mm%%dd%

@FOR /F "TOKENS=1* DELIMS= " %%A IN ('TIME /T') DO SET CTIME=%%A %%B
@FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('echo %CTIME%') DO SET mytime=%%B%%A
@Rem Echo mytime%mytime%

@SET mydatetime=%mydate%_%mytime%
@Echo . %mydatetime% > ".\DateTimeLast.txt"
@Echo . %mydatetime% > ".\DateTime%1.txt"
@SET mydatetimelong=%CDATE% %CTIME%
@Echo . %mydatetimelong% > ".\DateTimeLastLong.txt"
