addTwo:
    #map add to $t0
    add		$t0, $a0, $a1		# $t0 = $a0 + $a1
    move 	$v0, $t0		    # $v0 = $t0 (return value of addTwo)
    jr      $ra                 # jump to $ra

doSomething:
    
    # allocate space for the $sp registers we will use
    # along with $ra (x, y, a and $ra: 4 x 4 = 16 bytes)
    addiu   $sp, $sp, -16

    # save these values onto the stack
    sw		$s0, 0($sp)		   # store value of s0 in sp current location
    sw		$s1, 4($sp)		   # store value of s1 in sp + 4
    sw		$s2, 8($sp)		   # store value of s2 in sp + 8
    sw		$ra, 12($sp)       # store value of $ra in sp + 12

    # initialize $s0 ans $s1 with x and y respectively
    move 	$s0, $a0		    # $s0 = $a0	(s0 = x)	
    move 	$s1, $a1		    # $s1 = $a1 (s1 = y)
    
    # x and y are already in the right place for the first call to 
    # subTwo, so we can call it directly
    jal		addTwo			    # jump to addTwo and save position to $ra

    # move the return value of addTwo ("a") to $s2
    move 	$s2, $v0		    # $s2 = $v0
    
    # store a value of 10 in $t3
    li		$t3, 10		        # $t3 = 10
    
    # compute final result
    add		$v0, $t3, $s2		# $v0 = $t3 + $s2  (return value is 10 + a)

    # restore registers, deallocate, and return
    lw		$ra, 12($sp)		# load $ra with memory sp + 12
    lw		$s2, 8($sp)		    # load $s2 with memory sp + 8
    lw      $s1, 4($sp)         # load $s1 with memory sp + 4
    lw      $s0, 0($sp)         # load $s0 with memory current sp location
    addiu   $sp, $sp, 16        # move sp up 16 bytes (deallocate memory)
    jal		$ra				    # jump to $ra and save position to $ra

main:
    li		$a0, 20		        # $a0 = 20 (x = 20)
    li		$a1, 10		        # $a1 = 10 (y = 10)
    jal		doSomething			# jump to doSomething and save position to $ra

    move 	$t0, $v0		    # $t0 = $v0 (copy return value of doSomething into $t0)

    li		$v0, 1		        # print integer
    move 	$a0, $t0		    # $a0 = $t0 ($a0 inter to be printed)
    syscall

    li      $v0, 10             # end program
    syscall   