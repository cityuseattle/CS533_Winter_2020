main:

li $t1, 7

sll $t2, $t1, 1   #111 shift left = 1110

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall