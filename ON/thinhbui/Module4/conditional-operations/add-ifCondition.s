main:
    li $t0, 2
    li $t1, 5

    bge $t0, $t1, Cont
    add $a0, $t0, $t1
    li $v0, 1
    syscall

Cont:
    li $v0, 10
    syscall
    