main:

    li		$t1, 8		    # 1000
    
    ror     $t2, $t1, 1     # rotate right by 1, 100 = 4

    li		$v0, 1		    # $v0 = 1
    move 	$a0, $t2		# $a0 = $t2
    syscall

    li      $v0, 10
    syscall