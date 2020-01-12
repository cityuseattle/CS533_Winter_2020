data
hello:    .asciiz "Hello \n"
        .text
main:
        li $v0, 4
        la $a0, hello
        syscall

        li $v0, 1 # print int
        li $a0, 2020
        syscall

        li $v0, 10
        syscall 