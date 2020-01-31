            .data
Thanku:     .asciiz "\nThank You"
            .text

main:       
            li		$t0, 2		            # $t0 = 5
            li		$t1, 5		            # $t1 = 2
            
            ble		$t0, $t1, else_statm	# if $t0 <= $t1 then else_statm
            
            sub		$a0, $t0, $t1		    # $a0 = $t0 - $t1
            li		$v0, 1		
            syscall
            j		end_if				    # jump to end_if
            
else_statm:
            addi	$a0, $t0, 20			# $a0 = $t0 + 20
            li		$v0, 1		
            syscall

end_if:
            li		$v0, 4		# print string
            la		$a0, Thanku		
            syscall

            li		$v0, 10		# end program
            syscall
            
            
            
            
            
            