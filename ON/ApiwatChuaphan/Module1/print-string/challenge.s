        .data
one:    .asciiz "Hello \n"
        .text

main:
        li $v0, 4       # print_string
        la $a0, one     # load address of string to $a0
        syscall

        li $v0, 1       # print_int
        li $a0, 2020      # load address of 17 to $a0
        syscall
        
        li $v0, 10      # exit
        syscall
  