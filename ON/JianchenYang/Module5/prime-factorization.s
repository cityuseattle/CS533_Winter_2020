        .data
num:    .asciiz "please enter a number: "
msg:    .asciiz "The prime factorization of "
is:     .asciiz "is "
comma:  .asciiz ","
nl:     .asciiz "\n"
        .text

main:
        li $v0, 4
        la $a0, num
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0 ,4
        la $a0, msg
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4
        la $a0, is
        syscall

        li $t1, 2   #counter

while:
        bge $t1, $t0, end_while  #when conunter bigger/equal than input

        div $t0, $t1
        mfhi $t2

        bmez $t2, else

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 4
        la $a0, comma
        syscall

        mflo $t0

        j while

else:
        addi $t1, 1

        j while

end_while:
        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4
        la $a0, nl
        syscall

        li $v0, 10
        syscall