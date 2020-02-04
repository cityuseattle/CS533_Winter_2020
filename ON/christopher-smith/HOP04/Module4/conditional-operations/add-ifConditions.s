main:
        li      $t0, 2                          # $t0 =2
        li		$t1, 5                          # $t1 =5

       	bge		$t0, $t1, Cont              	# The condition is false because t0<t1, so no jump to cont label
                                                # and it will continue the code
        add		$a0, $t0, $t1           		# a = $t0 + $t1
        li      $v0, 1                          # print integer
        syscall

cont
        li      $v0, 10                         # End of code
        syscall
