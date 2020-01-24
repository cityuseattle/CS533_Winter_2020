#Challenge for Module 3 by Gabby Wargin 
#blt    t0, t1, target    branch to target if t0 < t1

main:
        li		$t0, 2 		            # $t0 = 2
        li		$t1, 5 		            # $t1 = 5

            .data
less:       .asciiz "$t0 is less than $t1 so the sum of the two variables is: "
nope:       .asciiz "$t0 was not less than $t1."
bye:        .asciiz "\nProgram ends here, bye!"
            .text

        blt		$t0, $t1, branch	    # if t0 < t1 then continue to branch, otherwise code 
                                        #continues to execute then jumps to "end program"

        li	    $v0, 4 		            #print string nope of t0 is larger than t2 (which in this case it is not)
        la		$a0, nope 
        syscall
        j end_program                   #jump to end_program

branch:
        li      $v0, 4                  #when branched (like in this case)
        la		$a0, less		        # print less string
        syscall

        add		$a0, $t0, $t1		    # after string is printed perform addition - $t3 = $t0 + $t1
        
        li      $v0, 1		            # print value then continue to end_program            
        syscall
        
end_program:
        li		$v0, 4 		            # print bye string
        la		$a0, bye        		
        syscall

        li		$v0, 10 		        # exit program
        syscall
        
        
        
        
        
        
        
        