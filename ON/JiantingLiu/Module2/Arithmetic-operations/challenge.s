        .data
endl:   .asciiz "\n"
sumR:   .asciiz "Sum of numbers: "
divR:   .asciiz "Div of numbers: "
mulR:   .asciiz "Mul of numbers: "
        .text


main:
        li $t1, 30
        li $t2, 5

        li $v0, 4
        la $a0, sumR
        syscall
        
        add $a0, $t1, $t2   # a0 = t1 + t2

        addi $a0, $a0, 7    # a0 = a0 + 7
        li $v0, 1           # out put the sum
        syscall

        li $v0, 4
        la $a0, endl
        syscall

        li $v0, 4
        la $a0, divR
        syscall

        div $t1, $t2    # t1 / t2
        mflo $a0        # stored the division result
        li $v0, 1       # out put the result
        syscall

        li $v0, 4
        la $a0, n1
        syscall

        li $v0, 4
        la $a0, mulR
        syscall

        mult $t1, $t2   # t1 * t2 = Hi and Lo registers
        mflo $a0        # used mflo to store low 32bit to the a0
        li $v0, 1       # out put the result
        syscall

        li $v0, 10
        syscall