            .data
msg:        .asciiz "Hello everyone, this is a function \n"
            .text

displayMsg:
            li		$v0, 4		        # print string
            la		$a0, msg	        # pring msg
            syscall

            jr		$ra			        # jump to $ra
            
main:
            jal		displayMsg			# jump to displayMsg and save position to $ra
            
            li      $v0, 10             # end program
            syscall
            