addNums:
add		$v1, $a0, $a1		# $v1 = a0 +a1
jr		$ra					# jump to $ra
main:
    li		$a0, 6		# $a0 =6 
    li		$a1, 9		# $a1 =9 
    jal		addNums				# jump to addNums and save position to $ra
    li		$v0, 1		# $v0 =1 
    move 	$a0, $v1	# $a0 =$v1
    syscall 
    li		$v0, 10		# $v0 =10 
    syscall