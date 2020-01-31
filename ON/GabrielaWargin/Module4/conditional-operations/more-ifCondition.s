            .data
Thanku:     .asciiz "\nThank You"
            .text

main:
            li		$t0, 5 		
            li		$t1, 2		

            ble		$t0, $t1, else_statm	# condition is false because t0>t1, it will contd the code

            sub		$a0, $t0, $t1           # a0 = t0 - t1
            li		$v0, 1		            # print integer
            syscall
            j		end_if				    # jump to end_if to skip the "end if" part

else_statm:                                 # skip 
            addi	$a0, $t0, 20			# this
            li		$v0, 1           		# part
            syscall
            
end_if:
            li       $v0, 4
            la       $a0, Thanku
            syscall
            
            li       $v0, 10
            syscall
            
            
            
            
            
            
            
            
            