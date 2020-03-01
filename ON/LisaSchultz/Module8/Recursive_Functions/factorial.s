        .data
prompt: .asciiz "Input an integer x:\n"
result: .asciiz "Fact(x) = "
        .text

factorial:
        # base case -- still in parent's stack segment
        # adjust stack pointer to store return address and argument
        addi	$sp, $sp, -8			# $sp = $sp + -8 
        # save $s0 and $ra
        sw		$s0, 4($sp)		        # store s0 at sp + 4
        sw		$ra, 0($sp)		        # store $ra at sp current location
        bne		$a0, 0, else	        # if $v0 != 0 then else
        addi    $v0, $zero, 1           # return 1 if base case
        j		fact_return				# jump to fact_return
        
else:
        # backup of $a0
        move 	$s0, $a0		        # $s0 = $a0
        addi	$a0, $a0, -1			# $a0 = $a0 + -1 (decrease a0 by 1)
        jal		factorial				# jump to factorial and save position to $ra
        # when we get here, we already have Fact(x-1) stored in $v0
        multu   $s0, $v0                # return x*Fact(x-1)
        mflo    $v0
fact_return:
        lw		$s0, 4($sp)		        # load stored value of s0
        lw		$ra, 0($sp)		        # load stored value of $ra
        addi    $sp, $sp, 8             # Deallocate stack memory
        jr		$ra					    # jump to $ra
        
main:
        # show prompt
        li		$v0, 4		            # print string
        la		$a0, prompt	
        syscall

        # read x
        li		$v0, 5		            # get user input and store in v0
        syscall

        # function call
        move 	$a0, $v0		        # $a0 = $v0 (user input stored in $a0)
        jal		factorial				# jump to factorial and save position to $ra
        move 	$t0, $v0		        # $t0 = $v0 (save return value of factorial into t0)

        #show prompt
        li		$v0, 4		            # print string
        la		$a0, result	
        syscall

        #print result
        li		$v0, 1		            # print integer
        move 	$a0, $t0		        # $a0 = $t0 
        syscall

        #end program
        li		$v0, 10		
        syscall
        
        
        
        
        
        
        
        
        