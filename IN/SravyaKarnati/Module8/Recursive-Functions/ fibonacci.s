		.data
msg1:	.asciiz "Give a number: "
		.text
fib:

	addi	$sp,$sp,-12
	sw		$ra,0($sp)
	sw		$s0,4($sp)
	sw		$s1,8($sp)

	move	$s0,$a0

	li 		$t1,1
	beq		$s0,$zero,return0
	beq		$s0,$t1,return1

	addi	$a0,$s0,-1

	jal		fib

	move	$s1, $v0

	addi	$a0,$s0,-2

	jal		fib

	add 	$v0,$v0,$s1

	exitfib:

		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		addi $sp,$sp,12
		jr $ra
	return1:
		li $v0,1
		j exitfib

	return0:
		li $v0,0
		j exitfib

	main:

		li 		$v0, 4
		la		$a0,msg1
		syscall

		li		$v0,5
		syscall
		move  	$a0,$v0

		jal	fib

		move	$a0,$v0
		li		$v0,1
		syscall

		li		$v0, 10
		syscall			

