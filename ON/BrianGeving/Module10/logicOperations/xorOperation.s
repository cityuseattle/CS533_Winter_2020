main:

li $t1, 7
li $t2, 5

xor $t0, $t1, $t2   #111 xor 101 = 010

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall