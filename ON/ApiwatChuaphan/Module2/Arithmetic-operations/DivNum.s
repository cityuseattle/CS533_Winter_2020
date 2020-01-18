        .data
msg1:   .asciiz "Div result is "
msg2:   .asciiz "\nRem is "
        .text

main:
            li $t1, 30
            li $t2, 5

            div $t1, $t2    # $t1 / $t2
            mflo $t3        # $t3 = floor($t1 / $t2)
            mfhi $t4        # $t4 = $t1 mod $t2

            li $v0, 4       # string
            la $a0, msg1
            syscall
            
            li $v0, 1
            move $a0, $t3   # copy value of t3 to a0
            syscall

            li $v0, 4       # string
            la $a0, msg2
            syscall

            li $v0, 1
            move $a0, $t4   # copy value of t4 to a0
            syscall

            li $v0, 10      # exit
            syscall