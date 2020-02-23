subTwo:
    # map sub to $t0
    sub     $t0, $a0, $a1
    move    $v0, $t0
    jr      $ra

doSomething:
    # allocate space for $ra, x, and y, which all must live past
    # the first call to subTwo
    addiu   $sp, $sp, -12

    # save these values onto the stack
    # note that we use different offsets, which is because everything
    # was allocated in a single large block
    sw      $ra, 8($sp)    
    sw      $a0, 4($sp)    
    sw      $a1, 0($sp)    

    # x and y are already in the right place for the first call to 
    # subTwo, so we can call it directly
    jal subTwo

    # load x and y into the right positions for the next call 
    # to subTwo.  Note that we intentionally flip where we place
    # these values, as the call is to subTwo(y, x)
    lw      $a0, 0($sp)
    lw      $a1, 4($sp)

    # allocate space on the stack for v, which needs to survive
    # past the second call to subTwo
    addiu   $sp, $sp, -4

    # store v on the stack, which is help in $v0
    # (where subTwo(x, y) returned)
    sw      $v0, 0($sp)

    # make the second call to subTwo
    jal subTwo

    # the result of subTwo(y, x) (b) is in $v0
    # add this to the previously stored a, which we'll need to grab
    # from the stack
    lw      $t0, 0($sp)
    add     $v0, $v0, $t0   # prep return value directly

    # load in the value of $ra from the stack.  Note that the offset
    # is different from before, as we since allocated additional values
    # on the stack
    lw      $ra, 12($sp)

    # deallocate space on the stack, and return
    addiu   $sp, $sp, 16
    jal     $ra

main:
    li      $a0, 20
    li      $a1, 10
    jal     doSomething

    move    $t0, $v0    # save the returning value of the function into t0

    li      $v0, 1
    move    $a0, $t0
    syscall

    li      $v0, 10
    syscall
        