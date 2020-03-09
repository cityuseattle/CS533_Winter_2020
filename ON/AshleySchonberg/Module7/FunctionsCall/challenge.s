addTwo:
    # map add to $t0
    add     $t0, $a0, $a1
    move 	$v0, $t0
    jr		$ra					# jump to $ra
    
doSomething:
    # allocate space for $ra, x, y
    addiu   $sp, $sp, -12

    # save values to stack
    sw		$ra, 8($sp)
    sw      $a0, 4($sp)
    sw      $a1, 0($sp)

    # x & y are in the right place, so okay to call addTwo
    jal		addTwo				# jump to addTwo and save position to $ra

    # allocate space for v
    addiu   $sp, $sp, -4

    # store v on the stack
    sw      $v0, 0($sp)

    # load in value of $ra from stack
    lw		$ra, 12($sp)

    # deallocate space on stack
    addiu   $sp, $sp, 16
    jal     $ra

    main:
        li  $a0, 20
        li  $a1, 10
        jal doSomething

        addi	$t0, $v0, 10			# return a + 10
        
        li  $v0, 1
        move    $a0, $t0
        syscall

        li  $v0, 10
        syscall