                .data
thanku:         .asciiz "\nThank You"
                .text

main: 
        li	    $t0, 1 		#challenge
        li      $t1, 2

        ble     $t0, $t1, else_statm

        sub     $a0, $t0, $t1
        li      $v0, 1
        syscall
        j		end_if				# jump to target
        
else_statm:
        addi		$a0, $t0, 20		# $a0 = $01 - 1t2
        li          $v0, 1
        syscall

end_if:
        li      $v0, 4
        la		$a0, thanku		# 
        syscall

        li      $v0, 10
        syscall
