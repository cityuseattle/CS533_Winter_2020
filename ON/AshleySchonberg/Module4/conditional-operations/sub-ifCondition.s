main:
        li		$t0, 2                  # t0 = 5
        li      $t1, 5                  # t1 = 2

        bge		$t0, $t1, else_statm	# if $t0 >= $t1 then jump to else_statm

        add		$a0, $t0, $t1           # a0 = t0 + t1
        li      $v0, 1                  # print integer
        syscall
        j		end_if_statement			# jump to end_if_statement

else_statm:
        sub     $a0, $t0, $t1           # a0 = t0 - t1
        li      $v0, 1                  # print integer
        syscall

end_if_statement:
        li      $v0, 10                 # end
        syscall
        
        
        
        