		.data
hello:	.asciiz "Hello \n"
nl:     .asciiz "\n"
		.text

main:
		li $v0, 4
		la $a0, hello
		syscall

        li $v0, 1
 	    li $a0, 2020 
 		syscall

        li $v0, 4   # new line
		la $a0, nl
		syscall

		li $v0, 10
		syscall
						