		.text

addNums:
		add $v1, $a0, $a1
		jr $ra

main:
		li $a0, 6
		li $a1, 9
		jal addNums
		
		li $v0, 1
		move $a0, $v1
		syscall
		
		li $v0, 10
		syscall
		