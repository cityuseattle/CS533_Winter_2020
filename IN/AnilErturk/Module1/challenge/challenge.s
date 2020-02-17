		.data
str:	.asciiz "Hello \n"
		.text

main:
	li $v0, 4 # print string
	la $a0, str
	syscall
	
	li $v0, 1 # print int
	li $a0, 2020
	syscall
	
	li $v0, 10 # exit
	syscall