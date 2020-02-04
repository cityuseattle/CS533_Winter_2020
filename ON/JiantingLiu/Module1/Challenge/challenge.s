        .data                   #Tell system we are going to assign some data
hello:  .asciiz "Hello \n"      #link the data to the string 
        .text                   #tell the system to read code command now

main:
        li $v0, 4           #load immediate with system call code 4 >> print string
        la $a0, hello       #v0 print a string value stored in $a0 >> "Hello \n"
        syscall
 
        li $v0, 1           #load immediate with system call code 1 >> print integer
        la $a0, 2020        #v0 print s an integer value stored in $a0 >> 2020
        syscall

        li $v0, 10         #program exit
        syscall
