                    .data
zero_string:        .asciiz "Choice is 0 \n"
one_string:         .asciiz "Choice is 1 \n"
two_string:         .asciiz "Choice is 2 \n"
fifty_string:       .asciiz "Choice is 50 \n"
Def_string:         .asciiz "Print default \n"
                    .text
main:
        li		$t0, 50

        beq		$t0, $zero, zero	# if $t0 == $zero then jump to "zero" label
        
        li		$t9, 1		
        beq		$t9, $t0, one	    
        
        li		$t9, 2 		
        beq		$t9, $t0, two	

        li		$t9, 50 		        # challenge addition
        beq		$t9, $t0, fifty     	# if $t9 == 0t1 then branch to 50
        
        j		default				

zero:
        li		$v0, 4		
        la		$a0, zero_string		
        syscall
        j		end_case				# jump to end_case, similar to break in c++

one: 
        li		$v0, 4 		
        la		$a0, one_string		
        syscall
        j		end_case				

two:
        li		$v0, 4		
        la		$a0, two_string	
        syscall
        j		end_case		

fifty:
        li		$v0, 4           		# print fifty_string
        la		$a0, fifty_string
        syscall
        j		end_case				#jump to end_case
        
dafault:
        li		$v0, 4
        la		$a0, Def_string
        syscall
        
end_case:
		li		$v0, 10		            #end of code
        syscall
        
        
        
        
        