# note that subTwo's definition remains the 
# same, as subTwo does not call anything
subTwo:
    #map sub to $t0
    sub		$t0, $a0, $a1		# $t0 = $a0 - $a1
    move 	$v0, $t0		    # $v0 = $t0
    jr      $ra

doSomething:
    # map x to $s0
    # map y to $s1
    # map a to $s2
    # optimization: because b doesn't need to live beyond
    # a call, we do not map it to an $sp register

    
    # allocate space for the $sp registers we will use
    # along with $ra (x, y, a and $ra: 4 x 4 = 16 bytes)
    addiu   $sp, $sp, -16

    # save these values onto the stack
    # note that we use different offsets, which is because everything
    # was allocated in a single large block
    sw		$s0, 0($sp)		    
    sw		$s1, 4($sp)		
    sw		$s2, 8($sp)		
    sw		$ra, 12($sp)

    # initialize $s0 ans $s1 with x and y respectively
    move 	$s0, $a0		# $s0 = $a0		
    move 	$s1, $a1		# $s1 = $a1
    
    # x and y are already in the right place for the first call to 
    # subTwo, so we can call it directly
    jal		subTwo			# jump to subTwo and save position to $ra

    # move the return value of subTwo ("a") to $s2
    move 	$s2, $v0		# $s2 = $v0

    # call subTwo with y and x
    move 	$a0, $s1		# $a0 = $s1  "x" is assigned y value previously stored in s1
    move 	$a1, $s0		# $a1 = $s0 "y" is assigned x value previously stored in s0
    jal		subTwo			# jump to subTwo and save position to $ra
    
    # compute final result
    add		$v0, $v0, $s2		# $v0 = $v0 + $s2  (return value is b + a)

    # restore registers, deallocate, and return
    lw		$ra, 12($sp)		
    lw		$s2, 8($sp)		
    lw      $s1, 4($sp)
    lw      $s0, 0($sp)
    addiu   $sp, $sp, 16
    jal		$ra				# jump to $ra and save position to $ra

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

    
    
    
    
    
    
    
    
    
    
    