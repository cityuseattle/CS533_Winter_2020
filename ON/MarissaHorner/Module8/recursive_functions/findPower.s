        .data
bprompt: .asciiz "Enter the base: "
eprompt: .asciiz "\nEnter the expotent: "
msg:    .asciiz "\nThe answer of b^e is: "
        .text
power:
        bne		$a1, $zero, recursion	# if the power is greater than 1, then jump to recursion label
        li		$v0, 1 		            # otherwise return 1
        jr		$ra					    # jump to $ra

recursion:
        addi	$sp, $sp, -4			# allocate space for one integer on the stack
        sw		$ra, 0($sp)		        # store the return address on the stack
        addi    $a1, $a1, -1            # decrease the power by one
        jal		power				    # call the power func with the new parameter
        mul     $v0, $a0, $v0           # multiply the result by the base and save it as the new res
        lw		$ra, 0($sp)		        # store the return address from the stack
        addi    $sp, $sp, 4             # deallocate the memory on the stacj
        jr      $ra                     # return to the calling function

main:
        li		$v0, 4                  # print string
        la		$a0, bprompt            # bprompt
        syscall
        
        li		$v0, 5                  # read integer from user
        syscall
       
        move 	$t0, $v0                # copy the value of user input into t0, t0=v0

        li		$v0, 4                  # print string
        la		$a0, eprompt            # bprompt
        syscall
        
        li		$v0, 5                  # read integer from user
        syscall
       
        move 	$t0, $v0                # copy the value of user input into t0, t0=v0

        jal     power                   # compute 5^3

        move 	$t0, $v0		        # $t0 = $v0

        li      $v0, 4                  # print string
        la		$a0, msg                # msg
        syscall

        li      $v0, 1                  # print integer
        move    $a0, $t0
        syscall                         # display the result

        li      $v0, 10                 # end program
        syscall

         
        
        
        
        
        