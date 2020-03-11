        .data
summ:    .asciiz "sum of numbers is: "
divm:     .asciiz "div of numbers is: "
mulm:    .asciiz "mul of numbers is: "
nl:     .asciiz "\n"
        .text

main:
    li $t1, 30
    li $t2, 5

    add $t4, $t2, 7
    add $t5, $t4, $t1

    div $t1, $t2
    mflo $t6

    mult $t1, $t2
    mflo $t7

    li $v0, 4
    la $a0, summ
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, divm
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, mulm
    syscall

    li $v0, 1
    move $a0, $t7
    syscall

    li $v0, 10
    syscall



