        .data
prompt: .asciiz "Enter an integer: \n"
msg:    .asciiz "You answer is "
nl:     .asciiz "\n"
        .text

fact:
        beqz    $a0, return1                # check if a0=0, jump to return label to return 1

        li		$v0, 1		                # $v0 =1 
        li		$t0, 1		                # $t0 =1   loop iterator
fact_loop:
        bgt		$t0, $a0, end_fact_loop	    # check the condition, if true then jump to the end, else
                                            # continue executing the loop

        mul     $v0, $v0, $t0               # v0 = v0*t0

        addi	$t0, $t0, 1			        # $t0++

        j		fact_loop				    # jump to fact_loop th check the condition

end_fact_loop:                              # jump here when the loop ends
        jr		$ra	


return1:                                    # jump here if a0==0
        li      $v0, 1
        jr		$ra

main:
         jal		fact				        # jump to fact func and save the address of the next instruction in ra

        li		$v0, 4
        la		$a0, prompt
        syscall
        
        li		$v0, 5
        syscall
       
        move 	$t0, $v0		            # after the func ends, copy the returned value v0 of func into t0

        li      $v0, 4                      # print string
        la		$a0, msg	                # adress of string "msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall   
        
        
        
        
        
        