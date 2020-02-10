# note that subTwo's definition remains the same
subTwo:
    # map sub to $t0
    sub     $t0, $a0, $a1
    move 	$v0, $t0
    jr		$ra					# jump to $ra
    
doSomething:
    # map x to $s0
    # map y to $s1
    # map a to $s2

    # allocate space for $ra, x, y
    addiu   $sp, $sp, -16

    # save the register's values
    sw  $s0, 0($sp)
    sw  $s1, 4($sp)
    sw  $s2, 8($sp)
    sw  $ra, 12($sp)

    # initialize $s0 and $s1 with x and y
    move    $s0, $a0
    move    $s1, $a1

    # x & y are in the right place, so okay to call subTwo
    jal		subTwo				# jump to subTwo and save position to $ra

    # move result to $s2
    move    $s2, $v0

    # call subTwo with y & x
    move    $a0, $s1
    move    $a1, $s0
    jal     subTwo

    # compute final result
    add		$v0, $v0, $s2

    # restore registers, deallocate, return
    lw		$ra, 12($sp)
    lw      $s2, 8($sp)
    lw      $s1, 4($sp)
    lw      $s0, 0($sp)
    addiu   $sp, $sp, 16
    jal     $ra

    main:
        li  $a0, 20
        li  $a1, 10
        jal doSomething

        move    $t0, $v0
        
        li  $v0, 1
        move    $a0, $t0
        syscall

        li  $v0, 10
        syscall