        .data
base:   .asciiz "Please enter a base number:\n"
ex:     .asciiz "Please enter a exponent number:\n"
msg:    .asciiz "The answer of b^e is: "
        .text
power:
        bne $a1, $zero, recursion #if power is greater than 1, then jump to recursion label
        li  $v0, 1 #else return 1
        jr  $ra

recursion:
        addi	$sp, $sp, -4 #allocate space for one register on the stack
        sw      $ra, 0($sp)		#store the return address on the stack
        addi    $a1, $a1, -1    #decrease the power by one
        jal	power				# jump to power and save position to $ra
        mul	$v0, $a0, $v0		# multiply the result by base a d save it as new res
        lw      $ra, 0($sp)         # store the return address from the stack
        addi    $sp, $sp, 4         # deallocate the memory on the stack
        jr      $ra

main:
        li $v0, 4 #print a string
        la $a0, base #printing a string
        syscall

        li $v0, 5 #read input from user
         #move user input from $v0 to $t0
        move $a0, $v0
        syscall
        

        li $v0, 4 #print a string
        la $a1, ex #printing a string
        syscall

        li $v0, 5 #read input from user
        move $a1, $v0 #move user input from $v0 to $t0
        syscall

        jal power   #compute 5^3

        move $t0, $v0

        li $v0, 4
        la $a0, msg
        syscall

        li $v0, 1
        move $a0, $t0
        syscall #display the result

        li $v0, 10
        syscall         
        
