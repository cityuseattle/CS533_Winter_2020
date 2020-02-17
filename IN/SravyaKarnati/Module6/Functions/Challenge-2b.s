        .data
num:    .asciiz "Please enter a number:\n"
n1:     .asciiz"\n"
        .text

fact:
        beqz $a0, return1 #checks for condition a0 = 0, jumps to return label to return 1

        li $v0, 1 #v0 = 1
        li $t0, 1 #t0 = 1, loop iterator
fact_loop:
        bgt $t0, $a0, end_fact_loop #check the condition, if trure then jump to end, else continue executing the loop


        mul $v0, $v0, $t0 #v0 = v0 * t0

        addi $t0, $t0, 1 #t0++

        j fact_loop #jump to fact_loop to check the condition

end_fact_loop:
        jr $ra


return1:
        li $v0, 1
        jr $ra

main:

        li $v0, 4 #print a string
        la $a0, num #printing a string
        syscall

        li $v0, 5 #read input from user
        syscall
        move $a0, $v0 #move user input from $v0 to $t0


        jal fact #jump to the fact function and save the address of the instruction in ra

        move $t0, $v0 #after the function ends, copy the returned value v0 of func into t0

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4 #print string
        la $a0, n1 #a0 = address of string n1
        syscall

        li $v0, 4 #print a string
        la $a0, num #printing a string
        syscall

        li $v0, 5 #read input from user
        syscall
        move $a0, $v0 #move user input from $v0 to $t0

       # li $a0, 7 #a0 = 7, functions argument
        jal fact #jump to fact function and save the address of next instruction in ra

        move $t0, $v0 #after the function ends, copy the returned vale v0 of the fucntion into t0

        li $v0, 1 #print integer
        move $a0, $t0 #move the value from t0 to a0
        syscall

        li $v0, 10 #exit
        syscall 