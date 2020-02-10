        .data               #tell assembler we are going to give it data
one:    .asciiz "Hello \n"  #tell assembler we are going to give it a string
        .text               #tell assembler to expect code now
main:          #tell qtspim where our code starts
        li $v0, 4       #print string
        la $a0, one     #load variable one into $a0 location
        syscall         #tell system to print variable in location $a0

        li $v0, 1       #print_int
        li $a0, 2020    #load variable 2020 into $a0 location
        syscall         #tell system to print variable in location $a0

        li $v0, 10      #exit
        syscall         #tell system to exit