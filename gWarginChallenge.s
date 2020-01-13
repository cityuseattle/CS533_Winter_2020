        .data #telling the assembler we are giving data to work with
hello:  .asciiz "Hello \n" #tells assembler we are giving it string(s)
        .text #tells assembler to expect code

main:     #label for main entry

        li $v0, 4 #load immediate with system call code to print string = 1
        la $a0, hello #v0 prints string 
        syscall #tells OS to do it's thing

        li $v0, 1 #load immediate with system call code to print int = 1
        li $a0, 2020 #v0 prints integer value
        syscall #tells OS to do it's thing

        li $v0, 10 #load immediate with system call code 10 to exit program
        syscall #tells os to do it's thing
