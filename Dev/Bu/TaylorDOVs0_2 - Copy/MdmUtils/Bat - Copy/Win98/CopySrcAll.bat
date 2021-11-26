@Rem
@Rem
@Rem Syntax: COPYSRCALL ALL DestionationPath DayWeek ALL Option
@Rem where options = d(elete contents)
@Rem
@Echo ...Backup from %1 to %2\%3 with options: %5
@Rem
@Rem Uses CopySrc:
@Rem Syntax: COPYSRC SourcePath DestionationPath DayWeek FileGroup Option
@Rem where options = d(elete contents)
@Rem ...Backup from %1 to %2\%3\%4 with options: %5
@Rem
@Rem
@Echo . C:\BAT\WIN98\COPYSRC.BAT e:\*.* %2 %3 Acs2_Sv2 %5
@Call C:\BAT\WIN98\COPYSRC.BAT e:\*.* %2 %3 Acs2_Sv2 %5
@Rem
@Echo . C:\BAT\WIN98\COPYSRC.BAT c:\*.* %2 %3 Acs2_OpSys %5
@Call C:\BAT\WIN98\COPYSRC.BAT c:\*.* %2 %3 Acs2_OpSys %5
@Rem
@Echo . C:\BAT\WIN98\COPYSRC.BAT g:\*.* %2 %3 Acs2_Dos %5
@Call C:\BAT\WIN98\COPYSRC.BAT g:\*.* %2 %3 Acs2_Dos %5
@Rem
@Rem
@Echo ...Finished Backup from %1 to %2\%3 with options: %5
@Rem
