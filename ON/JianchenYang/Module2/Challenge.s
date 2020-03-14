        .data
sum:   .asciiz "sum of numbers: "
divNum:   .asciiz "\n div of numbers is: "
mulNum:   .asciiz "mul of numbers is: "
nl: .asciiz "\n"
        .text

main:
        li $t1, 30
        li $t2, 5
        
        add $a0, $t1, $t2
        add $a1, $a0, 7
        li $v0, 1
        move $t0, $v0

        li $v0, 4
        la $a0, sum
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4
        la $a0, nl
        syscall

        div $t1, $t2
        mflo $t3
        mfhi $t4

        li $v0, 4
        la $a0, divNum
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 4
        la $a0, nl
        syscall

        mult $t1, $t2
        mflo $t3

        li $v0, 4
        la $a0, mulNum
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 10
        syscall