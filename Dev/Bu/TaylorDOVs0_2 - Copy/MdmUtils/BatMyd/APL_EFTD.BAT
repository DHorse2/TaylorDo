pause                       Mount the diskette (or break to exit)
del a:*.* < y.dat
copy \com\eft\pap80920 a:
dir a:
copy a:*.* nul:
chkdsk a:
pause                       The diskette has been written and verified
