subTwo:
    # map sub to $t0
    sub     $t0, $a0, $a1
    move 	$v0, $t0
    jr		$ra

doSomething:
    # map x to $s0
    # map y to $s1
    # map a to $s2
#===================================================
    # allocate space
    addiu   $sp, $sp, -16

    # This will save register value
    sw  $s0, 0($sp)
    sw  $s1, 4($sp)
    sw  $s2, 8($sp)
    sw  $ra, 12($sp)
#===================================================
    # initialize
    move    $s0, $a0
    move    $s1, $a1

    # Jump to subTwo
    jal		subTwo

    # move result
    move    $s2, $v0

    # call with x&y
    move    $a0, $s1
    move    $a1, $s0
    jal     subTwo

    # This will compute the final results
    add		$v0, $v0, $s2

    # This will restore the registers, deallocate them and the return
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
