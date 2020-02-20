fourth:
    jr      $ra

third:
    addiu   $sp, $sp, -4
    sw		$ra, 0($sp)		
    jal		fourth				# jump to fourth and save position to $ra
    lw		$ra, 0($sp)		    # 
    addiu   $sp, $sp, 4
    jr      $ra

second:
    addiu   $sp, $sp, -4
    sw      $ra, 0($sp)
    jal     third
    lw		$ra,0($sp)	
    addiu   $sp, $sp, 4
    jr      $ra

first:
    addiu   $sp, $sp, -4
    sw      $ra, 0($sp)
    jal     second
    lw		$ra, 0($sp)		# 
    addiu   $sp, $sp, 4
    jr      $ra

main:
    jal first               #call first function, ra = add of next instruction

    li		$v0, 1 		    # print integer
    li		$a0, 20 		# $a0  = 20
    syscall

    # perform the exit sycall from SPIM
    li      $v0, 10
    syscall
    
    
    


