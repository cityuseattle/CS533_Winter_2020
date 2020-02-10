subTwo:
    # map sub to $t0
    sub     $t0, $a0, $a1
    move 	$v0, $t0
    jr		$ra					# jump to $ra
    
doSomething:
    # allocate space for $ra, x, y
    addiu   $sp, $sp, -12

    # save values to stack
    sw		$ra, 8($sp)
    sw      $a0, 4($sp)
    sw      $a1, 0($sp)

    # x & y are in the right place, so okay to call subTwo
    jal		subTwo				# jump to subTwo and save position to $ra

    # load x & y into right positions for next call to subTwo; call is subTwo(y, x)
    lw		$a0, 0($sp)
    lw      $a1, 4($sp)

    # allocate space for v
    addiu   $sp, $sp, -4

    # store v on the stack
    sw      $v0, 0($sp)

    # second call to subTwo
    jal     subTwo

    # result of subTwo(y, x) (b) is in $v0, add this to a (grab from stack)
    lw      $t0, 0($sp)
    add     $v0, $v0, $t0

    # load in value of $ra from stack
    lw		$ra, 12($sp)

    # deallocate space on stack
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