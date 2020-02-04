            .data
ThankU:     .asciiz "\nThank You"
            .text

main:
        li		$t0, 5		# $t0 =5   
        li      $t1, 2

        ble		$t0, $t1, else_statm	# if $t0 <= $t1 then target
        
        sub     $a0, $t0, $t1
        li      $v0, 1
        syscall
        j		end_if				# jump to end_if
        
else_statm:
        addi	$a0, $t1, 20			# $a0 = $t1 + 0
        li      $v0, 1
        syscall

end_if:
        li      $v0, 4
        la		$a0, ThankU		# 
        syscall

        li      $v0, 10
        syscall
        