subtwo:
    sub     $t0, $a0, $a1
    move    $v0, $t0
    jr      $ra

dosomething:
    # map x to s0
    # map y to s1
    # map a to s2
    # allocate space for $sp
    addiu   $sp, $sp, -16

    # save register's val
    sw      $s0, 0($sp)
    sw      $s1, 4($sp)
    sw      $s2, 8($sp)
    sw      $ra, 12($sp)

    #initialize $s0, S1 with x and y
    move    $s0, $a0
    move    $s1, $a1
    
    #call subTwo with x and y (which are already in place)
    jal     subtwo

    #move resut to s2
    move    $s2, $v0

    #call subTwo with y and x 
    move    $a0, $s1
    move    $a1, $s0
    jal     subtwo

    #compute final result
    add     $v0, $v0, $s2

    #restore registers, deallocate, return
    lw      $ra, 12($sp)
    lw      $s2, 8($sp)
    lw      $s1, 4($sp)
    lw      $s0, 0($sp)
    addiu   $sp, $sp, 16
    jal     $ra

main:
    li      $a0, 20
    li      $a1, 10
    jal     dosomething

    move    $t0, $v0    #save return val of func to t0 

    li      $v0, 1
    move    $a0, $t0
    syscall

    li      $v0, 10
    syscall