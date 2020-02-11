        .data
prompt: .asciiz "Enter an interger: "
respon: .asciiz "You entered: "
endl:   .asciiz "\n"
        .text


main:

    li $v0, 4 #system code to print a string
    la $a0, prompt #print the string stored in "prompt"
    syscall

    li $v0, 5 #system code to take user input
    syscall
    move $t0, $v0 #store the user input in $t0

    li $v0, 4 #system code to print a string
    la $a0, respon #print the string stored in "respon"
    syscall

    li $v0, 1 #system code print an interger
    move $a0, $t0 #print the interger previously stored in $t0
    syscall

    li $v0, 4 #system code to print a string
    la $a0, endl #print the string stored in "endl"
    syscall

    li $v0, 10 #system code to exit
    syscall

