                    .data
zero_string:        .asciiz "Choice is 0 \n"
one_string:         .asciiz "Choice is 1 \n"
two_string:         .asciiz "Choice is 2 \n"
fifty_string:       .asciiz "Choice is 50 \n"
Def_string:         .asciiz "Print default \n"
                    .text

main:
        li		$v0, 5	            # Get input from user
        syscall
        move    $t0, $v0
        
        beq		$t0, $zero, zero	# if $t0 == $zero then zero
        li		$t9, 1		        # $t9 = 1
        beq		$t0, $t9, one	    # if $t0 == $t9 then one
        li		$t9, 2		        # $t9 = 2
        beq		$t0, $t9, two	    # if $t0 == $t9 then two
        li      $t9, 50             # $t9 == 50
        beq		$t0, $t9, fifty	    # if $t0 == $t9 then fifty        
        j		default				# jump to default
        
zero:
        li		$v0, 4		
        la		$a0, zero_string		# Case 0
        syscall
        j		end_case				# jump to end_case
        
one:
        li		$v0, 4		
        la		$a0, one_string		    #  Case 1
        syscall
        j       end_case

two:
        li		$v0, 4		
        la		$a0, two_string		    # Case 2
        syscall
        j		end_case				# jump to end_case
        
fifty:
        li      $v0, 4
        la      $a0, fifty_string       # Case 50
        syscall
        j		end_case				# jump to end_case
        
default:
        li      $v0, 4
        la      $a0, Def_string         # Default case
        syscall

end_case:
        li      $v0, 10
        syscall
            
        
        
        
        
        
        
        
        
        