main:

li $t1, 8

ror $t2, $t1, 1   #1000 rotate right one = 100

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall