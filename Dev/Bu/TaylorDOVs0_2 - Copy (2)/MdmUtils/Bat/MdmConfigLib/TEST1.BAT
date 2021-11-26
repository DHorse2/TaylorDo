@Echo off
@Echo .
@Echo . TEST1 place argument %1 in file
@Echo .
@Echo . Simply place %1 into the .result file
@Echo .
@Echo . del TEST1.result
@del TEST1.result
@Echo .
@Echo . syntax: TEST1 value (%1)
@Echo . Echo %1 1> TEST1.result
@Echo %1 1> TEST1.result
@Echo .
@Echo . Result:
@Type TEST1.result
@Echo .
@Echo . Done.