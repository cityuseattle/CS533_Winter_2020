        .data
msg1:   .asciiz "Mult result is "
        .text

main:
        li $t1, 30
        li $t2, 5

        mult $t1, $t2 #$t1*$t2, Hi & Lo reghistered
        mflo $t3 #copy Lo to $t

        li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 10
        syscall
