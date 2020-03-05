main:

        li		$t1, 7		    # $t1 = 7 binary equivalent of 7 = 111
        li		$t2, 5		    # $t2 = 5 binary equivalent of 5 = 101

        and     $t0, $t1, $t2   # 111 and 101 = 101 = 5 in decimal

        li		$v0, 1		    # $v0 = 1
        move 	$a0, $t0		# $a0 = $t0
        syscall

        li      $v0, 10
        syscall
        

        
        