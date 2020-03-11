.data                                       #tell the compiler that we have data to declare
inmsg: .asciiz "Enter an integer"          #inmsg is defined as string (address)
outmsg: .asciiz "You've entered: "          #outmsg is defined as string (address)
endl: .asciiz "\n"                          #endl is defined as string new line
.text                                       #now the program expects code to follow


main:
    li $v0, 4           #loading function to print string
    la $a0, inmsg       #loading address of inmsg
    syscall             #calling function

    li $v0, 5           #loading function to read input integer
    syscall             #function execution
    move $t0, $v0       #storing input value in temp value t0

    li $v0, 4           #loading function to print string
    la $a0, outmsg      #loading address of outmsg
    syscall             #executing the function

    li $v0, 1           #loading function to print integer
    move $a0, $t0       #storing value of t0 in a0
    syscall             #executing the function

    li $v0, 4           #loading function to print string
    la $a0, endl        #loading address of endl
    syscall             #executing function

    li $v0, 10          #loading function to exit code
    syscall             #executing exit function

        