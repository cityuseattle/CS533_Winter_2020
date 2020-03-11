        .data
hi:     .asciiz "Hello" #assigning value to string variable "Hello"
n1:     .asciiz "\n" #same thing with new line
        .text

main:
        li $v0, 4 #print string
        la $a0, hi #load argument hi
        syscall #calling the system to return the variable 

        li $v0, 4 #print string newline
        la $a0, n1
        syscall

        li $v0, 1 #load immediately value 
        li $a0, 2020 #identify the argument value to be loaded
        syscall

        li $v0, 10 #load immediately exit code
        syscall