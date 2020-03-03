needsTemps:
            add		$t0, $a0, $a1		# $t0 = $a0 + $a1
            sub		$t1, $a0, $a1		# $t1 = $a0 - $a1
            mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            move 	$v0, $t2		    # $v0 = $t2            
            jr		$ra					# jump to $ra
            
main:   
            li		$a0, 10		# $a0 = 10
            li		$a1, 8		# $a1 = 8
            jal		needsTemps				# jump to needsTemps and save position to $ra
            
            move    $t0,$v0

            li		$v0, 1		# $v0 = 1
            move    $a0, $t0
            syscall

            li      $v0, 10
            syscall