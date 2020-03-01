        .data
msg:    .asciiz "The answer of b^e is: "
msg2:   .asciiz "Enter the exponent: "
        .text

power:
        bne		$a1, $zero, recursion	# if the power is greater than 1, then jump to label
        li		$v0, 1		            # $v0 = 1 - otherwise return 1
        jr		$ra					    # jump to $ra

recursion:
        addi	$sp, $sp, -4			# $sp = $sp + -4 Allocate space for one integer on the stack
        sw		$ra, 0($sp)		        # store the return addess on the current sp location
        addi    $a1, $a1, -1            # decrease the power by 1
        jal		power				    # jump to power with new a1 parameter and save position to $ra
        mult	$v0, $a0			    # $v0 * $a0 = Hi and Lo registers multiply the result by the base and save it as the new result
        mflo	$v0					    # copy Lo to $v0
        lw		$ra, 0($sp)		        # load the return addess on the current sp location
        addi	$sp, $sp, 4			    # $sp = $sp + 4 - Deallocate the memory on the stack (move sp up 4)
        jr      $ra                     # return to the calling function

main:
        li		$v0, 4		            # $v0 = 4 - print string
        la		$a0, msg2		        # load msg2 string
        syscall
        
        #read and store user input for exponent
        li      $v0, 5                  # load system call code (5) to read an integer in reg $v0
        syscall                         # read integer value and store into reg $v0
        move    $a1, $v0                # copy the value of $v0 into temp reg $a1

        li      $a0, 5                  # store base of 5 in a0
        jal     power                   # compute 5^3 by jumping to power function

        move 	$t0, $v0		        # $t0 = $v0 - store return value of power into t0

        li		$v0, 4		            # $v0 = 4 - print string
        la		$a0, msg		        # load msg string
        syscall

        li      $v0, 1                  # print integer
        move    $a0, $t0		        # $a0 = $t0 
        syscall

        li		$v0, 10		            # $v0 = 10 end program
        syscall
        
        
        
        
        
        
        
        
        

        
        
        
        
        