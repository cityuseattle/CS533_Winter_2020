        .data
one:    .asciiz "this is string one"
        .text
main:
        li $v0, 4
        la $a0, one
        syscall

        li $v0, 10
        syscall
