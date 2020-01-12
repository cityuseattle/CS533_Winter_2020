        .data                   #tell the assembler that they contain data to work with
one:    .asciiz "Hello \n"      #tell the assembler that a string with null terminater is stored in memory 
        .text                   #tells that succeeding lines contain instructions

main:                           #lable for main entry
        li $v0,4                #load immediate with the system call code 4=>print string
        la $a0,one              #load address of the string from the memory into the register $ao to access it. Address in this case is "one".
        syscall                 #notify os to listen

        li $v0,1                #load immediate with the system call code 1=>print integer
        li $a0,2020             #v0 prints an integer value stored in $a0(x=2020 )    
        syscall                 #notify os to listen

        li $v0,10               #load immediate with the system call code 10=>exit(End of program)
        syscall                 #notify os to listen

