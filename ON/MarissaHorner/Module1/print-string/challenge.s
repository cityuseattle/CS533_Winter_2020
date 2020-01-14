      .data
one:    .asciiz "Hello \n"
two:    .asciiz "2020"
        .text
main:
        li $v0, 4
        la $a0, one
        syscall

        la $a0, two
        syscall

        li $v0,10
        syscall