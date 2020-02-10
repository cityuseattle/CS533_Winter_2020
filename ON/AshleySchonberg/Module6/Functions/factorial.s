fact:
        beqz    $a0, return1                # check if a0 = 0, if true jump to return1

        li		$v0, 1                      # v0 = 1
        li      $t0, 1                      # t0 = 1 loop iterator

fact_loop:
        bgt		$t0, $a0, end_fact_loop     # check condition, if true jump to end otherwise continue loop

        mul     $v0, $v0, $t0               # v0 = v0 * t0
        
        addi	$t0, $t0, 1			        # t0++

        j		fact_loop				    # jump to fact_loop

end_fact_loop:
        jr		$ra					        # jump to $ra

return1:
        li      $v0, 1
        jr      $ra

main:
        li      $a0, 6                      # a0 = 6
        jal		fact				        # jump to fact and save position to $ra

        move 	$t0, $v0                    # after func ends, move v0 value to t0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall
        
        