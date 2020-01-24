        .data
hello:  .asciiz "Hello \n" #give string hello data
        .text

main:
    li $v0, 4     #print_string
    la $a0, hello
    syscall

    li $v0, 1    #print_int
    la $a0, 2020
    syscall

    li $v0, 10   #exit
    syscall