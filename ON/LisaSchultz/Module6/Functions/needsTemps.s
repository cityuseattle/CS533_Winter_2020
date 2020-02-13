        .data
msg:    .asciiz "Your answer= "
        .text

needsTemps:
        add		$t0, $a0, $a1		# $t0 = $a0 + $a1
        sub		$t1, $a0, $a1		# $t1 = $a0 - $a1
        mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
        mflo	$t2					# copy Lo to $t2
        move 	$v0, $t2		    # $v0 = $t2 v0 contains the returning value of the function
        jr		$ra					# jump to $ra
        
main:
        li      $v0, 4              # print string
        la		$a0, msg		    # pring msg string
        syscall
        
        li		$a0, 10		        # $a0 = 10 
        li		$a1, 8		        # $a1 = 8
        jal		needsTemps			# jump to needsTemps and save position to $ra
          
        move    $t0, $v0            # copy the returned value of the function v0 into t0

        li      $v0, 1              # print an integer
        move    $a0, $t0            # copy the value of t0 into a0
        syscall

        li      $v0, 10             # end of program
        syscall
        
        