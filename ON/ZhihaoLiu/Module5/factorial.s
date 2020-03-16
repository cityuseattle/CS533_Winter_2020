        .data
num:    .asciiz "Enter a number: "
r:      .asciiz "! = "
nl:     .asciiz "\n"
        .text

main:
        li		$v0, 4		
        la		$a0, num		 
        syscall

        li		$v0, 5		
        syscall
        move 	$t0, $v0		
        
        li		$t1, 1		
        li		$t2, 1		

for_loop:
        bgt		$t1, $t0, exit	
        
        mul     $t2, $t2, $t1
        addi	$t1, $t1, 1			
        j		for_loop				

exit:
        li		$v0, 1		
        move 	$a0, $t0		
        syscall

        li		$v0, 4		
        la		$a0, r		
        syscall

        li		$v0, 1		
        move 	$a0, $t2		
        syscall
        
        li      $v0, 10
        syscall
        