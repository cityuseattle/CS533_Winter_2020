subTwo:
	#map sub to $t0
	sub $t0, $a0, $a1
	move $v0, $t0
	jr $ra
doSomething:

addiu $sp, $sp, -12


sw $ra, 8($sp)
sw $a0, 4($sp)
sw $a1, 0($sp)

jal subTwo

lw $a0, 0($sp)
lw $a1, 4($sp)

addiu $sp, $sp, -4

sw $v0, 0($sp)

jal subTwo

lw $t0, 0($sp)
add $v0, $v0, $t0

lw $ra, 12($sp)

addiu $sp, $sp, 16
jal $ra

main:
	li 	$a0, 20
	li  $a1, 10
	jal  doSomething

	move $t0, $v0

	li 	$v0, 1
	move $a0, $t0
	syscall

	li 	$v0, 10