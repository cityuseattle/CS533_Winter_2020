main:

        li		$t1, 7		    # $t1 = 7
        li		$t2, 5		    # $t2 = 5

        or     $t0, $t1, $t2    # 111 and 101 = 111 = 7 in decimal

        li		$v0, 1		    # $v0 = 1
        move 	$a0, $t0		# $a0 = $t0
        syscall

        li      $v0, 10
        syscall
        
        