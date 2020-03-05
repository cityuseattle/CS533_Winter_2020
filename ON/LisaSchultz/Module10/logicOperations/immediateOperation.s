        .data
nl:     .asciiz "\n"
        .text

main:
        li		$t0, 7		    # $t0 = 7

        andi    $t1, $t0, 5     # 111 and 101 = 5 in decimal

        li		$v0, 1		    # $v0 = 1
        move 	$a0, $t1		# $a0 = $t1 to be printed
        syscall

        li      $v0, 4
        la		$a0, nl		    # load the address of nl into a0
        syscall

        xori    $t1, $t0, 5     # 2 in decimal

        li		$v0, 1		    # $v0 = 1
        move 	$a0, $t1		# $a0 = $t1 to be printed
        syscall

        li		$v0, 4		    
        la      $a0, nl         
        syscall

        ori     $t1, $t0, 5

        li		$v0, 1		    # $v0 = 1
        move 	$a0, $t1		# $a0 = $t1 to be printed
        syscall

        li		$v0, 4		    
        la      $a0, nl         
        syscall

        li		$v0, 10		
        syscall
        

        
        
        
        