main:

li $t1, 51

rol $t2, $t1, 1   #110011 rotate left 1 = 1100110

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall