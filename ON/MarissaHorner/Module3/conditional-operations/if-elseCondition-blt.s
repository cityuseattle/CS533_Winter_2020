main:
        li		$t0, 1		# $t0 =1 
        li		$t1, 0		# $t1 =0

        .data
g:      .asciiz "Greater or equal \n"
ng:     .asciiz "Not Greater or equal \n"
hello:  .asciiz "Hello again \n"
        .text

    blt		$t0, $t1, else_statm	# This condition is false because t0>t1, so it will continue the code


    li		$v0, 4 		
    la		$a0, g		            # It will print greater or equal
    syscall
    j end_if                        # we don't want to execute the else statement, so it will
                                    # jump to end_if label to execute the code after the else statement
else_statm:                        
        li		$v0, 4 		
        la      $a0, ng
        syscall
end_if:                             # It will jump here to skip the else_statm part
        li      $v0, 4
        la      $a0, hello          # print "Hello again"
        syscall

        li $v0, 10
        syscall
    
    
    
    
        
        