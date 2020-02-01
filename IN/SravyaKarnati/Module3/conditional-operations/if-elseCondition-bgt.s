main:
		li 	$t0, 1
		li 	$t1, 0

		.data
if:		.asciiz "If \n"
Else:	.asciiz "Else \n"
hello:	.asciiz "hello again \n"
		.text

		bgt	$t0, $t1, else_statm

		li 	$v0, 4
		la 	$a0, if
		syscall
		j	end_if


else_statm:
		li	$v0,4
		la	$a0, Else
		syscall

end_if:
		li	$v0, 4
		la	$a0, hello
		syscall

		li	$v0,10
		syscall						