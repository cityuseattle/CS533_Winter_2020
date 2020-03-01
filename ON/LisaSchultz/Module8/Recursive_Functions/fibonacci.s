        .data
msg1:   .asciiz "Give a number: "
        .text

fib:
    # a0 = y
    # if (y == 0) return 0;
    # if (y == 1) return 1;
    # return ( fib(y-1) + fib(y-2) );

    addi	$sp, $sp, -12			# $sp = $sp +-12 (save 3 x 4 bytes in stack)
    sw		$ra, 0($sp)		        # store ra in current location of sp
    sw		$s0, 4($sp)		        # store s0 in 1 position up from sp
    sw		$s1, 8($sp)		        # store s1 in 2 positions up from sp

    move 	$s0, $a0		        # $s0 = $a0  (copy new parameter value for y)

    li		$t1, 1		            # $t1 = 1
    beq		$s0, $zero, return0	    # if $s0 == $zero then return0
    beq		$s0, $t1, return1   	# if $s0 == $t1 return1

    addi	$a0, $s0, -1			# $a0 = $s0 +-10  (subtract 1 from a0 "y")

    jal		fib				        # jump to fib and save position to $ra
    
    move 	$s1, $v0		        # $s1 = fib(y-1)

    addi	$a0, $s0, -2			
    
    jal		fib				        # v0 = fib(y - 2)
    
    add 	$v0, $v0, $s1			# $v0 = fib(y-2) + $s1

exitfib:
    #load variables from stack
    lw		$ra, 0($sp)		        
    lw		$s0, 4($sp)
    lw		$s1, 8($sp)
    #deallocate stack memory
    addi	$sp, $sp, 12			
    jr		$ra					    # jump to $ra

return1:
    li		$v0, 1		            # $v0 = 1
    j		exitfib				    # jump to exitfib
    
return0:
    li		$v0, 0		            #v0 = 0
    j		exitfib				    # jump to exitfi
    
main:
    li		$v0, 4		            # print prompt 
    la		$a0, msg1		
    syscall

    li		$v0, 5		            # read user input
    syscall
    move 	$a0, $v0		        # $a0 = $v0 (user input)

    jal		fib				        # jump to fib and save position to $ra
    
    move 	$a0, $v0		        # $a0 = v01
    li		$v0, 1		            # $v0 = 1 (print integer)
    syscall

    #end program
    li		$v0, 10	
    syscall
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    