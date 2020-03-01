        .data
msg:     .asciiz "The answer of b^e is: "
enterBase:     .asciiz "Enter the base: "
enterExponent:     .asciiz "Enter the exponent: "
        .text
power:
        bne     $a2,    $zero, recursion    # if the power is greater than 1, then jump to recursion label
        li      $v0,    1                   # otherwise return 1
        jr      $ra

recursion:
        addi    $sp, $sp, -4            # allocate space for one integer on the stack
        sw		$ra, 0($sp)		# store the return address on the stack
        addi	$a2, $a2,  -1	# decrease the power by one
        jal     power           # call the power func with the new parameter
        mul     $v0, $a1, $v0   # multiply the result be the base and save it as the new res
        lw      $ra, 0($sp)     # store the return address from the stack
        addi    $sp, $sp, 4     # deallocate the memory on the stack
        jr      $ra

main:
        # li      $a0, 5
        # li      $a1, 3

        li		$v0, 4          # print string
        la      $a0, enterBase 	# load address of enterBase string
        syscall

        li		$v0, 5 	        # reads an integer
        syscall
        move 	$a1, $v0		# copy the value of $v0 into a1

        li		$v0, 4          # print string
        la      $a0, enterExponent 	# load address of enterExponent string
        syscall

        li		$v0, 5 	        # reads an integer
        syscall
        move 	$a2, $v0		# copy the value of $v0 into a2

        jal     power           # compute a1^a2

        move    $t0, $v0

        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall                 # display the result

        li      $v0, 10
        syscall
        