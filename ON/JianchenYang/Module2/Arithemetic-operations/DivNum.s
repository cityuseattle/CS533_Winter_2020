        .data
msg1:   .asciiz "Div result is "
msg2:   .asciiz "\nRem is "
        .text

main:
        li $t1, 30
        li $t2, 5

        div $t1, $t2
        mflo $t3
        mfhi $t4

        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $t4
        syscall

        li $v0, 10
        syscall