main:
        li		$t0, 2                  # $t0=2
        li      $t1, 5                  # $t1=5
        li      $a0, 0                  # $a0=0

        .data
if:     .asciiz "If \n"
else:   .asciiz "Else \n"
n1:     .asciiz "\n"
        .text

        bge		$t0, $t1, else_statm	# In this case, bge condition is false because t0<t1, so it will
                                        # continue executing the code
        add		$a0, $t0, $t1		    # $a0 = $01 + 1t2
        
        li      $v0, 1                  # print integer
        syscall
        j end_if                        # we don't want to execute the else statement part, so j"jump" to
                                        # "end-if" label to continue executing the code after the else part
else_statm:                             
        li      $v0, 4                  
        la      $a0, else
        syscall

end_if:
        li      $v0, 4
        la      $a0, n1                 # print new line
        syscall
        
        li      $v0, 10
        syscall