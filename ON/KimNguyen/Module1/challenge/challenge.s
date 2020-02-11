        .data
strg:   .asciiz "Hello \n"
        .text

main:

        li $v0, 4 #system code to print a string
        la $a0, strg #print the string that was stored in "strg"
        syscall

        li $v0, 1 #system code to print an interger
        li $a0, 2020 #print the interger "2020"
        syscall

        
        li $v0, 10 #system code to exit the program
        syscall


