                .data
zero_string:    .asciiz "Choice is 0\n"
one_string:     .asciiz "Choice is 1\n"
two_string:     .asciiz "Choice is 2\n"
fifty_string:   .asciiz "Choice is 50\n"
def_string:     .asciiz "print default\n"
                .text

main:
        #li		$t0, 0 		

        li      $v0, 5
        syscall
        move 	$t0, $v0		# challenge

        beq		$t0, $zero, zero
        li      $t9, 1
        beq     $t0, $t9, one
        li      $t9, 2
        beq     $t0, $t9, two
        li      $t9, 50
        beq     $t0, $t9, fifty  #challenge
        j		default				
        
zero:
        li      $v0, 4
        la		$a0, zero_string    		 
        syscall
        j		end_case				

one:
        li      $v0, 4
        la		$a0, zero_string    	 
        syscall
        j		end_case				


two:
        li      $v0, 4
        la		$a0, two_string    		 
        syscall
        j		end_case				


fifty:
        li      $v0, 4
        la		$a0, fifty_string    		# challenge
        syscall
        j		end_case				


default:
        li      $v0, 4
        la		$a0, def_string    		
        syscall
    


end_case: 
        li      $v0, 10
        syscall