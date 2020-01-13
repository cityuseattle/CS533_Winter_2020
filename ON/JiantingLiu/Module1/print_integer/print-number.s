    .data
n1: .asciiz "\n"
    .text



main:
        li $v0, 1
        li $a0, 17
        syscall

        li $v0, 4
        la $a0,n1
        syscall

        li $v0, 1
        li $a0, 71
        syscall

        li $v0, 4
        la $a0,n1
        syscall

        li $v0, 1
        li $a0, 25
        syscall

        li $v0, 10
        syscall