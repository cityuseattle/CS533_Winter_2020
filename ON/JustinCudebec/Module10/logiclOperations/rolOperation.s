main:

li $t1, 51           # 51 = 110011 in binary

rol $t2, $t1, 1     # rotate left by 1, t2 = 1100110 which is equal to 102 in decimal

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall