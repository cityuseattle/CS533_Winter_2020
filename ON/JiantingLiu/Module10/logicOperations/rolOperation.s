main:

li		$t1, 51		# $t1 = 51

rol     $t2, $t1, 1

li		$v0, 1		# $v0 = 1
move 	$a0, $t2		# $a0 = $t2
syscall

li		$v0, 10		# $v0 = 10
syscall