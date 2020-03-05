main:

    li		$t1, 51		# 110011
    
    rol     $t2, $t1, 1     # rotate left by 1, 1100110 = 102

    li		$v0, 1		    # $v0 = 1
    move 	$a0, $t2		# $a0 = $t2
    syscall

    li      $v0, 10
    syscall