        .data
msg2:   .asciiz "Enter the base: "
msg3:   .asciiz "Enter the exponent: "
msg1:   .asciiz "The answer of b^e is: "
        .text

power:
        bne	$t2, $zero, recursion	# if the power is greater than 1, then jump to recursion label
        li	$v0, 1		            # other return 1
        jr      $ra

recursion:
        addi	$sp, $sp, -4			# Allocate space for one integer on the stack
        sw	$ra, 0($sp)     		# store the return address on the stack
        addi    $t2, $t2, -1            # decrease the power by one
        jal     power                   # call the power func with the new parameter
        mul     $v0, $t1, $v0           # multiply the result by the base and save it as the new res
        lw	$ra, 0($sp)		        # store the return address from the stack
        addi    $sp, $sp, 4             # deallocate the memory on the stack
        jr      $ra

main:
        li      $v0, 4
        la	$a0, msg2		        # print msg2
        syscall

        li      $v0, 5                  #read int
        syscall
        move    $t1, $v0                # save int to t1
   
        
        li      $v0, 4
        la	$a0, msg3		        # print msg3
        syscall

        li      $v0, 5                  # read int
        syscall
        move    $t2, $v0                # save int to t2 
        

        jal     power                   #computer t1 ^ t2

        move 	$t0, $v0		        # $t0 = $v0

        li      $v0, 4
        la	$a0, msg1		        # print string msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall                         # display the result

        li      $v0, 10
        syscall


         
        
        
        
        