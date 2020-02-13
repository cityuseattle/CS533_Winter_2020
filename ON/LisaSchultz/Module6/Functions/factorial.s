        .data
nl:     .asciiz "\n"
prompt: .asciiz "Enter an integer: "
        .text

fact:
        beqz    $a0, return1            # check if a0=0, jump to return label to return 1

        li		$v0, 1		            # $v0 = 1
        li		$t0, 1		            # $t0 = 1   loop iterator
fact_loop:
        bgt		$t0, $a0, end_fact_loop	# if $t0 > $a0 then end_fact_loop
        
        mul  	$v0, $v0, $t0			# $v0 = $v0 * $t0
        
        addi	$t0, $t0, 1			    # $t0 = $t0 + 1

        j		fact_loop				# jump to fact_loop to check condition

end_fact_loop:
        jr		$ra					    # jump to $ra

return1:                                # jump here if a0 == 0
        li      $v0, 1
        jr		$ra					    # jump to $ra

main:
        li      $v0, 4                  # print string
        la      $a0, prompt             # print prompt string
        syscall 

        li      $v0, 5                  # read user input
        syscall                         # read integer value and store into reg $v0
        move    $a0, $v0                # copy the value of $v0 into temp reg $a0, func's arg
        
        jal		fact				    # jump to fact and save position to $ra
        
        move 	$t0, $v0		        # $t0 = $v0 copy returned value v0 into t0

        li      $v0, 1
        move 	$a0, $t0		        # $a0 = $t0
        syscall
        
        li      $v0, 10
        syscall

        
        
        
        