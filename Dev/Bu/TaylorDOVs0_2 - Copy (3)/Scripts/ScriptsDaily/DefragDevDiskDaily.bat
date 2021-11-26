@Echo off
@Echo -------- Command: DefragDevDiskDaily
@call "..\Commands\DoSortFast.bat"
@call "..\Commands\DoGapNoVacate.bat"
@start 