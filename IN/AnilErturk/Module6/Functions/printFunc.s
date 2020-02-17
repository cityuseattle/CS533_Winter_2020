		.data
msg:	.asciiz "Hello everyone, this is a function \n"
		.text

displayMsg:
		li $v0, 4
		la $a0, msg
		syscall
		
		jr $ra

main:
		jal displayMsg
		
		li $v0, 10
		syscall