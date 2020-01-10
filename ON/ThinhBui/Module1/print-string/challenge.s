        .data
ca:     .asciiz "Hello \n"
        .text
main:
        li $v0, 4;
        la $a0, ca
        syscall

        li $v0, 1;
        li $a0, 2020;
        syscall

        li $v0, 10;
        syscall
        
        
        