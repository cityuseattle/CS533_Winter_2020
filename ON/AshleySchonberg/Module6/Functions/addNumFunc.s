addNums:
        add		$v1, $a0, $a1       # v1 = a0 + a1
        jr		$ra					# jump to next instruction of jal addNums

main:
        li		$a0, 6              # a0 = 6
        li      $a1, 9              # a1 = 9
        jal     addNums             # call addNums function, save address on next instrction to $ra

        li      $v0, 1              # print integer
        move 	$a0, $v1            # move v1 into a0 for printing
        syscall

        li      $v0, 10             # end
        syscall