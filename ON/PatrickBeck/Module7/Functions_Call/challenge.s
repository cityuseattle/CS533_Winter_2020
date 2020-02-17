# note that addTwo's definition remains the
# same, as addTwo does not call anything
addTwo:
                    # map add to $t0
                    add       $t0, $a0, $a1
                    move      $v0, $t0
                    jr        $ra

doSomething:
                    # map x to $s0
                    # map y to $s1
                    # map a to $s2
                    # optimization: because b doesn't need to live beyond
                    # a call, we do not map it to an $sp register

                    # allocate space for the $sp registers we will use,
                    # along with $ra
                    addiu     $sp, $sp, -16

                    # save the register's values
                    sw        $s0, 0($sp)
                    sw        $s1, 4($sp)
                    sw        $s2, 8($sp)
                    sw        $s3, 12($sp)
                    sw        $ra, 16($sp)

                    # initialize $s0 and $s1 with x and y, respectively
                    move      $s0, $a0
                    move      $s1, $a1
                    move      $s2, $a2

                    # call addTwo with x and y, which are already in place
                    jal       addTwo

                    # move the result to $s2
                    move      $s3, $v0

                    # compute final result (x+y)+10; $s2 = value of $a2 = 10; 
                    # $s3 = x + y
                    add       $v0, $s2, $s3

                    # restore registers, deallocate, and return
                    lw        $ra, 16($sp)
                    lw        $s3, 12($sp)
                    lw        $s2, 8($sp)
                    lw        $s1, 4($sp)
                    lw        $s0, 0($sp)
                    addiu     $sp, $sp, 16
                    jal       $ra

main:
                    li        $a0, 20
                    li        $a1, 10
                    li        $a2, 10
                    jal       doSomething

                    move      $t0, $v0            # save the returning value of the function into t0

                    li        $v0, 1
                    move      $a0, $t0
                    syscall

                    li        $v0, 10
                    syscall