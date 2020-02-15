        .data
n1:     .asciiz "\n"
        .text 

fact:  
        beqz    $a0, return1                # check if a0=0, jump to return label to return 1

        li		$v0, 1                      # v0 = 1
        li		$t0, 1		                # $t0 = 1 loop iterator
fact_loop:
        bgt		$t0, $a0, end_fact_loop	    # if $t0 > $a0 then end_fact_loop. check cond - if true then jump 
                                            #to the end, else contd executing the loop
        
        mul	    $v0, $v0, $t0			    # $v0 * $v0 *t0

        addi	$t0, $t0, 1			        # t0++

        j		fact_loop				    # jump here when the loop ends

end_fact_loop:
        jr		$ra					        # jump to $ra

return1:                                    #jump here if a0==0
        li      $v0, 1                      
        jr		$ra					


main:
        li      $a0, 6                      #a0=6 func's argument
        jal		fact				        # jump to fact and save the address of next instruct in ra

        move 	$t0, $v0	            	# after the func ends, copy the returned value v0 for func into t0

        li      $v0, 1
        move 	$a0, $t0		            
        syscall

        li      $v0, 4                      #print string
        la		$a0, n1		                # a0 = address of string n1
        syscall                             #print the string that in a0

        ###################################call the functon again

        li      $a0, 7                      # a0 = 7 func's argument
        jal     fact                        # jump to the fact func and save the address of next instruct in ra

        move    $t0, $v0                    #after the func ends, copy the returned value v0 of the fuc into t0

        li      $v0, 1                      #print integer
        move    $a0, $t0                    #move the value fo t0 into a0
        syscall
        
        li      $v0, 10 
        syscall
        
        
        
        
        
        
        
        