.data
nl: .asciiz "\n"
.text

main:
    li $t0, 2
    li $t1, 7
    li $t2, 5
    li $t3, 8

    add $t4, $t0, $t3
    add $t5, $t2, 17
    sub $t6, $t0, $t1
    mult $t1, $t2
    mflo $t7
    div $t0, $t1
    mflo $t8
    mfhi $t9

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, nl
    syscall

     li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 1
    move $a0, $t7
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 1
    move $a0, $t8
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 1
    move $a0, $t9
    syscall

    li $v0, 10
    syscall


