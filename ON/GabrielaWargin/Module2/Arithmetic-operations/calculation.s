        .data
nl:     .asciiz "\n"
        .text

main:
        li	$t0, 2 		        # $t0=2
        li	$t1, 7	   	        # $t1 = 7
        li	$t2, 5		        # $t2 = 5 
        li	$t3, 8 		        # $t3 = 8

        add	$a0, $t0, $t3       # $a0 = $t0 + $t3 (2+8)
        li      $v0, 1              #print integer
        syscall                 #print the result of the addition

        li      $v0, 4
        la	$a0, nl         #print new line
        syscall
        
        addi	$a0, $t2, 17	# $a0 = $t2 + 17 (5+17)
        li	$v0, 1          # print integer
        syscall 

        li	$v0, 4		
        la	$a0, nl		    # print new line
        syscall

        sub     $a0, $t0, $t1   #a0=t0=t1 (2-7)
        li	$v0, 1          #print integer
        syscall                 #print the result of the subtraction

        li      $v0, 4
        la      $a0, nl         #pint new line
        syscall

        mult    $t1, $t2        #size of one register is 32 bits, then multiplication of two register are 64 bits
                                #the result will be saved in two registers [hi lo]
        mflo    $a0             #we multiplied small numbers so we used mflo to see result, then a0 = t1*t2
        li	$v0, 1
        syscall

        li      $v0, 4
        la	$a0, nl         #print new line
        syscall

        div     $t1, $t2        #hi = remainder, low = quotient = $t1/$t2
        mflo    $a0             #a0 = t1/t2
        li	$v0, 1          #print integer
        syscall

        li	$v0, 4          #print new line
        la	$a0, nl
        syscall

        mfhi    $a0             #mfhi will copy the remainder of the div operation of t1/t2 into a0
        li      $v0, 1
        syscall

        li	$v0, 4         #print new line
        la	$a0, nl
        syscall

        rem     $a0, $t1, $t0  #another way to get the remainder of ao=t1 % t0
        li	$v0, 1
        syscall

        li	$v0, 4
        la	$a0, nl         #print new line
        syscall

        li	$v0, 10
        syscall
        
        
        
        
        
        
        
        
        
        

        
        
        
        
        
        
        