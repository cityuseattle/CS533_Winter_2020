main:

    li		$t1, 7		    # 111

    sll     $t2, $t1, 1     #shift by 1, t2 = 1110 (14)

    li		$v0, 1		    # $v0 = 1
    move 	$a0, $t2		# $a0 = $t2
    syscall

    li      $v0, 10
    syscall
    
