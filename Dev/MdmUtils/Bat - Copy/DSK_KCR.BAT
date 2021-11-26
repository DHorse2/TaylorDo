cls
rem            Create \CABLE subdirectory on floppies...
pause          insert diskette #1 of 4...
del a:*.*
copy \cable\rosmedia.map a:
copy \cable\ros0????.* a:
copy \cable\roserror.* a:
pause          insert diskette #2 of 4...
del a:*.*
copy \cable\ros1????.* a:
pause          insert diskette #3 of 4...
del a:*.*
copy \cable\ros10250.020 a:
copy \cable\ros10250.030 a:
copy \cable\ros10250.040 a:
copy \cable\ros10251.* a:
copy \cable\*.exe a:
copy \cable\*.com a:
pause          insert diskette #4 of 4...
del a:*.*
copy \cable\$???????.* a:
copy \cable\*.xtk a:
copy \cable\*.xts a:
copy \cable\xtalk.hlp a:
copy \cable\xthelp.dir a:
copy \cable\xtalk.pif a:
