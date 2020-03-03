        .data
msg:    .asciiz "Hello everyone.\n"
        .text

displayMeg:
        li		$v0, 4		# $v0 = 4
        la		$a0, msg		# 
        syscall

        jr		$ra					# jump to $ra
        
main:   
        jal		displayMeg				# jump to displayMeg and save position to $ra
        
        li		$v0, 10		# $v0 = 10
        syscall