	.data
n1: .asciiz "\n"
	.text

main:
	li $v0, 1 # print int
	li $a0, 17
	syscall
	
	li $v0, 4 # print string
	la $a0, n1
	syscall
	
	li $v0, 1 # print int
	li $a0, 71
	syscall
	
	li $v0, 4 # print string
	la $a0, n1
	syscall
	
	li $v0, 1 # print int
	li $a0, 45
	syscall
	
	li $v0, 10 # exit
	syscall