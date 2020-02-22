        .data
msg:    .asciiz "Your answer = "
        .text

needsTemps:
            add		$t0, $a0, $a1		# $t0 = $t1 + $t2
            sub		$t1, $a0, $a1		# $t1 = $t1 - $t2
            mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            move 	$v0, $t2		    # v0 contain the returning value of the function
            jr		$ra					# jump to the address that saved in $ra

main:
            li		$a0, 10 		    # a0=10 func's argument
            li      $a1, 8              # a1=8 func's argument
            jal		needsTemps			# call the func needsTemps and save the address of
                                        # next instruction in resgiter $ra

            move    $t0, $v0            # copy the returned value of the function v0 into t0

            li		$v0, 4              # print string
            la		$a0, msg            # return string in "msg"	
            syscall

            li      $v0, 1              # print integer
            move    $a0, $t0            # copy the value of t0 into a0
            syscall                     # print the value of a0

            li      $v0, 10             # end of the program
            syscall
             
            
            
            
            