main:
        li		$t0, 5 		            # $t0 = 5
        li      $t1, 0                  # t1= 0

            .data
g:          .asciiz "Greater \n"
ng:         .asciiz "Not greater \n"
hello:      .asciiz "Hello again \n"
            .text

        ble		$t0, $t1, else_statm	# This condition is FALSE because t0 is GREATER than t1, 
                                        #so it will continue to run code then jump to end_if to print hello again

        li      $v0, 4
        la		$a0, g, 		
        syscall
        j end_if

else_statm:

        li      $v0, 4
        la		$a0, ng		            # load the address of ng string in a0
        syscall                         #print the string in a0
end_if:
        li      $v0, 4
        la      $a0, hello              #print "hello again"
        syscall

        li      $v0, 10
        syscall


    #CHALLENGE changed t1 to 5 and updated line 11 comment.
        
        
        