        .data
msg1:   .asciiz "Give a number: "
        .text
fib:
        #a0=y
        #if (y==0) return 0;
        #if (y==1) return 1;
        #return (fib(y-1)+fib(y-2) );

        addi	$sp, $sp, -12			# $sp = $sp + -12 - save in stack
        sw		$ra, 0($sp)		
        sw		$s0, 4($sp)
        sw		$s1, 8($sp)		

        move 	$s0, $a0		        # $s0 = $a0

        li		$t1, 1		            # $t1 = 1
        beq		$s0, $zero, return0	    # if $s0 == $zero then jump to return0 label
        beq		$s0, $t1, return1	    # if $s0 == 1, jump to return1 label

        addi    $a0, $s0, -1            #a0 = s0-1, same as a0 in c++

        jal		fib				        # jump to fib and save position to $ra

        move    $s1, $v0                # $s1=fib(y-1)

        addi    $a0, $s0, -2

        jal		fib			        	# v0 = fib (y-2)

        add		$v0, $v0, $s1		    # $v0 = fib(y-2)+$s1

        exitfib:

            lw $ra,0($sp)
            lw $s0,4($sp)
            lw $s1,8($sp)
            addi $sp, $sp, 12           # bring back to stack pointer
            jr $ra

            return1:
            li $v0, 1
            j exitfib

            return0:
            li $v0, 0
            j exitfib

main:       li      $v0, 4
            la		$a0, msg1
            syscall                       #print msg

            li      $v0, 5                  #read int
            syscall
            move    $a0, $v0                #move to a0

            jal     fib                     #call fib

            move    $a0, $v0              # $a0 = v0 the fucntion output
            li      $v0, 1                  #print integer
            syscall

            li      $v0, 10
            syscall
            
        
        
        
        
        
        
        
        
        
        