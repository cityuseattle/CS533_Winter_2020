        .data
result: .asciiz "The answer is: "
        .text

fib:
        li      $t1, 0                  # a = 0
        li      $t2, 1                  # b = 1
        li		$v0, 1		            # $v0 = 1  initialize c value to 1
        
        beqz    $a0, return0            # check if a0=0, jump to return label to return 0
        beq		$a0, 1 , return1	    # check if a0=1, jump to return label to return 1
         
        li		$t0, 1		            # $t0 = 1   loop iterator
        sub		$t3, $a0, 1		        # $a0 = $a0 - 1 t3 is loop condition to exit
fib_loop:
        bgt		$t0, $t3, end_fib_loop	# if $t0 > $a0 then end_fact_loop
        add		$v0, $t1, $t2		    # $v0 = $t1 + $t2 (c = a + b)
        move 	$t1, $t2		        # $t1 = $t2 (a = b)
        move    $t2, $v0                # $t2 = $v0 (b = c)
        
        addi	$t0, $t0, 1			    # $t0 = $t0 + 1  iterate i value

        j		fib_loop				# jump to fib_loop to check condition

end_fib_loop:
        jr		$ra					    # jump to $ra

return0:                                # jump here if a0 == 0
        li      $v0, 0                  # return value of 0
        jr		$ra					    # jump to $ra

return1:                                # jump here if a0 == 1
        li      $v0, 1                  # return value of 1
        jr		$ra					    # jump to $ra

main:
        li      $v0, 4                  # print string
        la      $a0, result             # print result string
        syscall 

        li		$a0, 16		            # $a0 = 16 (n = 16) funct arg
        jal		fib				        # jump to fib and save position to $ra

        move    $t0, $v0                # copy the returned value of the function v0 into t0
        
        li      $v0, 1                  # print an integer
        move    $a0, $t0                # copy the value of t0 into a0
        syscall
        
        li      $v0, 10
        syscall