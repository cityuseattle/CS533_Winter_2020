addNums:
        add		$v1, $a0, $a1		# $v1 = $a0 + $a1 v1 is your return value
        jr		$ra					# jump to the next instruction of jal addNums

main:
        li		$a0, 6		        # $a0 = 6 function's argument
        li		$a1, 9		        # $a1 = 9
        jal     addNums             # call the function add Nums and save the address of next
                                    # instruction in $ra

        li		$v0, 1		        # $v0 = 1 print int
        move 	$a0, $v1		    # $a0 = $v1
        syscall 

        li      $v0, 10             # end program
        syscall
        
        
        
        
        