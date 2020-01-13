        .data               # tell assembler give it some data
hello:  .asciiz "Hello"     # create string hello and given its meaning
nl:     .asciiz "\n"        # create nl to be newline
        .text
main:
        li $v0, 4           #print string
        la $a0, hello       #address of string is 'hello'
        syscall             #system call code

        li $v0, 4           #print string
        la $a0, nl
        syscall

        li $v0, 1           #print int
        li $a0, 2020
        syscall

        li $v0, 10      # exit
        syscall