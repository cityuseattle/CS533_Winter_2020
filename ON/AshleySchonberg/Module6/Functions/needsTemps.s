needsTemps:
        add		$t0, $a0, $a1       # t0 = t1 + t2
        sub		$t1, $a0, $a1       # t1 = t1 - t2
        mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
        mflo	$t2					# copy Lo to $t2
        move 	$v0, $t2            # move t2 value to v0
        jr		$ra					# jump to $ra
        
main:
        li		$a0, 10             # a0 = 10
        li      $a1, 8              # a1 = 8
        jal		needsTemps			# jump to needsTemps and save position to $ra

        move    $t0, $v0            # move v0 value to t0

        li      $v0, 1              # print integer
        move    $a0, $t0            # move t0 to a0 for printing
        syscall

        li      $v0, 10             # end
        syscall
        