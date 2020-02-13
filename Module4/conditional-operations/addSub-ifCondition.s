main:
        li		$t0, 2
        li      $t1, 5

        bge		$t0, $t1, else_statm	# if $t >= $t1 then target

        add		$a0, $t0, $t1		# $a0 = $t1 + $t2
        li      $V0, 1
        syscall
        j		end_if_statment				# jump to end_if_statment


else_statm:
        sub		$a0, $t0, $t1		# $t0 = $t1 - $t2
        li      $v0, 1
        syscall

end_if_statment:
        li      $v0, 10
        syscall