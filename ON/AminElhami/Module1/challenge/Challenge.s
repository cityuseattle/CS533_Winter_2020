    .data
msg: .asciiz "Hello \n"
    .text

main:    #load for the main entry
    li $v0, 4 #load print string
    la $a0, msg #load the predefined msg
    syscall #tell OS to print the string

    li $v0, 1  #load print integer
    li $a0, 2020 #load 2020 that is stored in $a0
    syscall #tell OS to print the integer

    li $v0, 10 #exit code
    syscall #tell OS to exit
