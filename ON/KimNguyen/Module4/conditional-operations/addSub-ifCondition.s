main: 
        li	    $t0, 2 		
        li      $t1, 5

        bge     $t0, $t1, else_statm

        add     $a0, $t0, $t1
        li      $v0, 1
        syscall
        j		end_if_statement				# jump to target
        
else_statm:
        sub		$a0, $t0, $t1		# $a0 = $01 - 1t2
        li      $v0, 1
        syscall

end_if_statement:
        li      $v0, 10
        syscall
