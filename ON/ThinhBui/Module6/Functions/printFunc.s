.data
msg: .asciiz "Hello everyone, this is a function \n"
.text

displayMsg:
li		$v0,  4		# $v0   = 4 
la		$a0, msg		# 
syscall 
jr		$ra					# jump to $ra

main:
    jal		displayMsg				# jump to displayMsg and save position to $ra
    li		$v0, 10		# $v0 =10 
    syscall