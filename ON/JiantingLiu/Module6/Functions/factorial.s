fact:   
        beqz    $a0, return1

        li		$v0, 1		# $v0 = 1
        li		$t0, 1		# $t0 = 1

fact_loop:
        bgt		$t0, $a0, end_fact_loop 	# if $t0 > $a0 then end_fact_loop 
        
        mul     $v0, $v0, $t0

        addi	$t0, $t0, 1			# $t0 = $t0 + 1
        
        j		fact_loop				# jump to fact_loop
        
end_fact_loop:
        jr		$ra					# jump to $ra
        
return1:
        li		$v0, 1		# $v0 = 1
        jr		$ra					# jump to $ra
        
main:
        li		$a0, 6		# $a0 = 6
        jal		fact				# jump to fact and save position to $ra
        
        move 	$t0, $v0		# $t0 = $v0 
        li		$v0, 1          # $v0 = 1
        move 	$a0, $t0		# $a0 = $t0 
        move 	$a0, $t0		# $a0 = $t0
        syscall

        li		$v0, 10		# $v0 = 10
        syscall
        