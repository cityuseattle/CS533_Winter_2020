        .data
msg:    .asciiz "The answer of b^e is: "


        .text
power:
        bne	$a1, $zero, recursion	# if the power is greater than 1, then jump to recursion label
        li	$v0, 1		            # other return 1
        jr      $ra

recursion:
        addi	$sp, $sp, -4			# Allocate space for one integer on the stack
        sw		$ra, 0($sp)     		# store the return address on the stack
        addi    $a1, $a1, -1            # decrease the power by one
        jal     power                   # call the power func with the new parameter
        mul     $v0, $a0, $v0           # multiply the result by the base and save it as the new res
        lw	$ra, 0($sp)		        # stor ethe return address from the stack
        addi    $sp, $sp, 4             # deallocate the memory on the stack
        jr      $ra

main:
        li      $a0, 5
        li      $a1, 3
        jal     power                   #compute 5^3

        move 	$t0, $v0		        # $t0 = $v0

        li      $v0, 4
        la	$a0, msg		        # print string msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall                         # display the result

        li      $v0, 10
        syscall


         
        
        
        
        