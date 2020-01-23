		.data
one:	.asciiz "Hello \n"
two:	.asciiz "2020"
		.text

main:				# label for the main entry
		li $v0, 4 	# load immediate with the system call code for print string
		la $a0, one # address of string load address for string one
		syscall		# operation to tell the operating system to print string in $a0 one

		la $a0, two # address of string, load address for string two
		syscall		# operation to tell the operating system to print string in $a0 two

		li $v0,10	# call code for end of program
		syscall		# operation to tell the operating system to print string in $a0 two