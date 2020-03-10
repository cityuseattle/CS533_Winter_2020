        .data
arr:    .word 3, 2, 1, 8, 6
        .text

main:
    la $t1, arr
    li $t0, 0

loop1:
    bge $t0, 5, exit

    lw $t2, 0($t1)
    addi $t1, $t1, 4

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 11
    li $a0, 32
    syscall

    addi $t0, $t0, 1
    j loop1

exit:
    li $v0, 10
    syscall