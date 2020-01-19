        .data
n1:     .asciiz "\n"
sum:    .asciiz "Sum of numbers: "
divide: .asciiz "Div of numbers: "
multi:   .asciiz "Mul of numbers: "
        .text

main:
        li $t1, 30
        li $t2, 5

        li $v0, 4
        la $a0, sum
        syscall
        
        add $a0, $t1, $t2   # a0 = t1 + t2

        addi $a0, $a0, 7    # add 7 to a0 which is 35 now
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, n1
        syscall

        li $v0, 4
        la $a0, divide
        syscall

        div $t1, $t2    # t1 / t2
        mflo $a0        # used mflo to see result, a0 = t1 / t2
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, n1
        syscall

        li $v0, 4
        la $a0, multi
        syscall

        mult $t1, $t2   # t1 * t2 = Hi and Lo registers
        mflo $a0        # used mflo to see result, a0 = t1 * t2
        li $v0, 1
        syscall

        li $v0, 10
        syscall