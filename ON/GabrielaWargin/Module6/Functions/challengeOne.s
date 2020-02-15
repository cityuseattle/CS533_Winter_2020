#first challenge of HOP Module 6 by Gabby Wargin

        .data
n1:     .asciiz "\n"
ask1:   .asciiz "Input number for factorial: "
ask2:   .asciiz "\nInput another one! "
answer: .asciiz "The answer is..."
        .text 

fact:  
        beqz    $a0, return1                    # check if a0=0, jump to return label to return 1

        li      $v0, 1                          # v0 = 1
        li      $t0, 1		                # $t0 = 1 loop iterator
fact_loop:
        bgt     $t0, $a0, end_fact_loop	        # if $t0 > $a0 then end_fact_loop. check cond - if true then jump 
                                                #to the end, else contd executing the loop
        
        mul	$v0, $v0, $t0			# $v0 * $v0 *t0

        addi	$t0, $t0, 1			        # t0++

        j	fact_loop	                # jump here when the loop ends

end_fact_loop:
        jr	$ra                      # jump to $ra

return1:                                 #jump here if a0==0
        li      $v0, 1                      
        jr	$ra					


main:
        la      $a0, ask1
        li	$v0, 4		        # string to ask for first input                   
        syscall

        li      $v0, 5                  #read input
        syscall

        move    $a0, $v0                
        jal	fact		        # jump to fact and save the address of next instruct in ra

        move 	$t0, $v0	        # after the func ends, copy the returned value v0 for func into t0

        la      $a0, answer             #print string for answer
        li      $v0, 4         	 
        syscall 

        li      $v0, 1                  #answer
        move 	$a0, $t0		            
        syscall

        la	$a0, n1		         # space string
        li      $v0, 4
        syscall

      

        ################################### call the functon again

        la      $a0, ask2               #print another one string
        li	$v0, 4
        syscall
        
        li      $v0, 5                  #read integer
        syscall  

        move    $a0, $v0                 #move integer to a0
        jal     fact                     # jump to the fact func and save the address of next instruct in ra

        move    $t0, $v0                 #after the func ends, copy the returned value v0 of the fuc into t0

        la      $a0, answer             #answer string
        li	$v0, 4         		    
        syscall 

        li      $v0, 1                   #print integer/answer
        move    $a0, $t0                 #move the value fo t0 into a0
        syscall
        
        li      $v0, 10                 #end program
        syscall
        
        
        
        
        
        
        
        