fibonacci:
        li		$t0, 0		# a = 0
        li		$t1, 1		# b = 1
        
        beqz    $a1, return0
        beq		$a1, 1, return1	         # if $a1 == 1 then return1
        
        sub	$a0, $a0, 2			    # $a0 = $a0 - 2
        
for:    
        beqz    $a0, end_loop

        add 	    $v0, $t1, $t0			# $v0 = $t1 + $t0
        move		$t0, $t1		        # $t0 = $t1
        move		$t1, $v0		        # $t1 = $v0
        
        sub	    $a0, $a0, 1			# $a0 = $a0 - 1
        
        j		for				# jump to for
        
end_loop:
        jr		$ra					# jump to $ra       

return0:
        li		$v0, 0		        # $v0 = 0
        jr		$ra					# jump to $ra

return1:
        li		$v0, 1		        # $v0 = 1
        jr		$ra					# jump to $ra

main:
        li      $a0, 1
        jal		fibonacci				# jump to   fibonacci and save position to $ra
        
        move 	$t0, $v0		# $t0 = $v0
        li		$v0, 1		# $v0 = 1   
        move 	$a0, $t0		# $a0 = $t0
        syscall
        
        li		$v0, 10		# $V0 = 10
        syscall
        