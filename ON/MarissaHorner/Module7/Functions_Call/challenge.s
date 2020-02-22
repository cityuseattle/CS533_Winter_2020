addTwo:
    # map add to $t0
    add		$t0, $a0, 10		# $t0 = $a0 + 10
    move 	$v0, $t0            # move $t0 to $v0
    jr		$ra					

doSomething:

    addiu   $sp, $sp, -16

    # save the register's values
    sw		$s0, 0($sp)		
    sw      $s1, 4($sp)
    
    sw      $ra, 12($sp)

    # initialize $s0 and $s1 with x and y, respectively
    move    $s0, $a0
    move    $s1, $a1


    # compute final result
    add $v0, $v0, $s2

    # restore registers, deallocate, and return
    lw		$ra, 12($sp)		
    lw      $s2, 8($sp)
    lw      $s1, 4($sp)
    lw      $s0, 0($sp)
    addiu   $sp, $sp, 16
    jal     $ra


main:
    li		$a0, 20 	
    li		$a1, 10
    jal     doSomething

    move    $t0, $v0        # save the returning value of the function into t0

    li		$v0, 1
    move    $a0, $t0
    syscall

    li		$v0, 10
    syscall