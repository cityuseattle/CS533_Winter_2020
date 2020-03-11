main:
    li $t0, 2
    li $t1, 5

    bgt $t0, $t1, great
    add $t2, $t0, $t1
    li $v0, 1
    move $a0, $t2
    syscall
great:
    li $v0, 10
    syscall