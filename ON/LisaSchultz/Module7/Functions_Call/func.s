fourth:
    jr $ra

third:
    addiu   $sp, $sp, -4    # allocate 4 bytes to stack
    sw		$ra, 0($sp)		# store $ra into current postiton of stack pointer (push)
    jal		fourth			# jump to fourth and save position to $ra
    lw		$ra, 0($sp)		# load in $ra memory stored at the current sp position (pop)
    addiu   $sp, $sp, 4     # dealloate 4 bytes from stack
    jr      $ra             # jump to $ra

second:
    addiu   $sp, $sp, -4    # allocate 4 bytes to stack
    sw		$ra, 0($sp)		# store $ra into current postiton of stack pointer (push)
    jal		third			# jump to third and save position to $ra
    lw		$ra, 0($sp)		# load in $ra memory stored at the current sp position (pop)
    addiu   $sp, $sp, 4     # dealloate 4 bytes from stack
    jr      $ra             # jump to $ra

first:
    addiu   $sp, $sp, -4    # allocate 4 bytes to stack
    sw		$ra, 0($sp)		# store $ra into current postiton of stack pointer (push)
    jal		second			# jump to second and save position to $ra
    lw		$ra, 0($sp)		# load in $ra memory stored at the current sp position (pop)
    addiu   $sp, $sp, 4     # dealloate 4 bytes from stack
    jr      $ra             # jump to $ra

main:
    jal first               # call first function, ra = add of next instruction

    li		$v0, 1		    # print integer
    li		$a0, 20		    # $a0 = 20
    syscall                 # print the value of a0

    #perform the exit syscall from SPIM
    li		$v0, 10		    # exit program
    syscall
    
    
    
    
    