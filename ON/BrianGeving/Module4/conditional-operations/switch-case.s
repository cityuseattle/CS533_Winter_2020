                    .data
prompt:             .asciiz "Enter a number: "
zero_string:        .asciiz "Choice is 0 \n"
one_string:         .asciiz "Choice is 1 \n"
two_string:         .asciiz "Choice is 2 \n"
fifty_string:       .asciiz "Choice is 50 \n"
Def_string:         .asciiz "Print default \n"
                    .text

main:
        li $v0, 4               #print string
        la $a0, prompt          #print prompt contents
        syscall
        li $v0, 5               #take input
        syscall
        move $t0, $v0           #move value from v0 to t0

        beq $t0, $zero, zero    #branch to zero if t0=0
        li $t9, 1
        beq $t0, $t9, one       #branch to one if t0=1
        li $t8, 2
        beq $t0, $t8, two       #branch to two if t0=2
        li $t7, 50
        beq $t0, $t7, fifty     #branch to fifty in t0=50
        j default

zero:
        li $v0, 4
        la $a0, zero_string
        syscall
        j end_case

one:
        li $v0, 4
        la $a0, one_string
        syscall
        j end_case

two:
        li $v0, 4
        la $a0, two_string
        syscall
        j end_case

fifty:
        li $v0, 4
        la $a0, fifty_string
        syscall
        j end_case

default:
        li $v0, 4
        la $a0, Def_string
        syscall

end_case:
        li $v0, 10
        syscall
