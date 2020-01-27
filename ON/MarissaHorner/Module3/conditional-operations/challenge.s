main:
        li		$t0, 2		# $t0 =0
        li		$t1, 5		# $t1 =5

        .data
g:      .asciiz "Greater \n"
ng:     .asciiz "Not Greater \n"
nl:     .asciiz "\n"
hello:  .asciiz "Hello again \n"
        .text

        blt		$t0, $t1, else_statm	# This condition is true because t0<t1, so it will jump to the else statement


    li		$v0, 4 		
    la		$a0, g		            
    syscall
    j end_if                        
                                    
else_statm:                         # It will jump here because t0 is not >= to t1                     
        li		$v0, 4 		
        la      $a0, ng

        add		$a0, $t0, $t1		# $a0 = $t0 + $t1 (2+5)
        li		$v0, 1       		# print integer
        syscall

        li		$v0, 4
        la		$a0, nl     		# print new line
        syscall
end_if:                             
        li      $v0, 4
        la      $a0, hello          # print "Hello again"
        syscall

        li $v0, 10
        syscall