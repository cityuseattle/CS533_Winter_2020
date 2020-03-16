        .data
msg:    .asciiz "Hello everyone.\n"
        .text

displayMeg:
        li		$v0, 4		
        la		$a0, msg		
        syscall

        jr		$ra					
        
main:   
        jal		displayMeg				
        
        li		$v0, 10		
        syscall