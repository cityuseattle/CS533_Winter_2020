        .data
list:   .word 3, 4, 5, 6
        .text

main:
        la		$t0, list		# load the address of the beginnning of the array list[0] into $t0

        lw		$t1, 4($t0)		# t1 = first element in the array list[1]=4

        li		$v0, 1		    # $v0 = 1
        move 	$a0, $t1		# $a0 = $t1
        syscall

        li      $v0, 10
        syscall
        
        
        