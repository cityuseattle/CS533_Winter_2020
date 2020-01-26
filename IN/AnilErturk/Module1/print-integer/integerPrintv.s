	.data
	.text

main:
	li $v0, 1 # print int
	li $a0, 17
	syscall
	
	li $v0, 10 # exit
	syscall