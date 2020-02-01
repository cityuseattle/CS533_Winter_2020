main:
		li 	$t0, 2
		li 	$t1, 5

		bge	$t0, $t1, Else_statm

        add	 	$a0, $t0, $t1		
		li	 	$v0,  1        
		syscall   
		j end_if

Else_statm:
		li $v0,10
		syscall
end_if:
		li $v0,10
		syscall