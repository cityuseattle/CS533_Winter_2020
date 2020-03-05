main:

    li		$t1, 7		# 111
    
    srl     $t2, $t1, 1     #shift by 1, t2 = 011 (3)

    li		$v0, 1		    # $v0 = 1
    move 	$a0, $t2		# $a0 = $t2
    syscall

    li      $v0, 10
    syscall