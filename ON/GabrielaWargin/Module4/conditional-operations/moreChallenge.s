            .data
Thanku:     .asciiz "\nThank You"
            .text

main:
            li		$t0, 2 		            #switched values from previous example. 
            li		$t1, 5		

            ble		$t0, $t1, else_statm	# condition is now true, 2 < 5 - branch to else_statm

            sub		$a0, $t0, $t1           # skip
            li		$v0, 1		            # this part
            syscall
            j		end_if				    # jump to end_if to skip the "else_statm" part

else_statm:                                 
            addi	$a0, $t0, 20			# add t0 + 20 // 2 + 20
            li		$v0, 1           		# print integer = 22
            syscall
            
end_if:
            li       $v0, 4                 #print string
            la       $a0, Thanku
            syscall
            
            li       $v0, 10                #end code
            syscall
            
            
            
            
            
            
            
            
            