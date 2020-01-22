        .data
n1:     .asciiz "\n"
        .text

main:
        li		$t0, 2 		# $t0 = 2
        li		$t1, 7 		# $t1 = 7
        li		$t2, 5 		# $t2 = 5
        li		$t3, 8 		# $t3 = 8

        add		$a0, $t0, $t3		# $a0 = $t0 + $t3 (2+8)
        li      $v0, 1              # print integer
        syscall                     # print the result of the addition
        
        li      $v0, 4
        la      $a0, n1             # print new line
        syscall

        addi	$a0, $t2, 17		# $a0 = $t2 + 17 (5+17)
        li      $v0, 1              # print integer
        syscall                     # print the result of the addition

        li      $v0, 4
        la      $a0, n1             # print a new line
        syscall

        sub     $a0, $t0, $t1       # $a0=$t0-$t1 (2-7)
        li      $v0, 1              # print integer
        syscall                     # print the result of the subtraction

        li      $v0, 4
        la      $a0, n1             # print a new line
        syscall

        mult	$t1, $t2			# $t1 * $t2 = Hi and Lo registers
        mflo	$a0					# copy Lo to $a0
        li      $v0, 1
        syscall

        li      $v0, 4
        la      $a0, n1             # print a new line
        syscall

        div		$t1, $t2			# $t1 / $t2
        mflo	$a0					# $a0 = floor($t1 / $t2) 
        li      $v0, 1              # print integer
        syscall

        li      $v0, 4
        la      $a0, n1             # print a new line
        syscall


        mfhi	$a0					# $a0 = $t1 / $t2
        li      $v0, 1
        syscall

        li      $v0, 4
        la      $a0, n1             # print a new line
        syscall

        rem     $a0, $t1, $t0
        li      $v0, 1
        syscall

        li      $v0, 4
        la      $a0, n1             # print a new line
        syscall

        li      $v0, 10
        syscall

        
        