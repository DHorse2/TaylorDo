@Rem
@Echo Off
@Rem
@\Dos\Mem %1 %2 %3 %4 %5 %6 %7 %8 %9 > %OpSys.Drv%\TempFile\Mem.Dat
@Type %OpSys.Drv%\TempFile\Mem.Dat | More
