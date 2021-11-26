@Rem . Test3 Contents
@Rem .
@Rem .
@Rem .
@Rem .
@Rem .
@Echo . Simply wrap %2 into the .result file named %1
@Echo .
@Echo . del TEST3%1.result
@del TEST3%1.result
@Echo .
@Echo . Echo %2 1> TEST3%1Result.bat
@Echo @Echo . 1> TEST3%1Result.bat
@Echo @Echo . xxx%2xxx 1>> TEST3%1Result.bat
@Echo @Echo . 1>> TEST3%1Result.bat
@Echo @Echo . Done 1>> TEST3%1Result.bat
@Echo .
@Echo . Result:
@Type TEST3%1.result
@Echo .
@Echo . Done.