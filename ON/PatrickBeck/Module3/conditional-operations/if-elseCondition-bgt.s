main:
        li		$t0, 0                  # $t0=0
        li      $t1, 0                  # $t1=0

        .data
if:     .asciiz "If \n"
else:   .asciiz "Else \n"
hello:  .asciiz "Hello again \n"
        .text

        bgt		$t0, $t1, else_statm	# In this case, bgt condition is false because t0=t1, so it will
                                        # continue executing the code
        li      $v0, 4
        la		$a0, if		            # it will print "if" here
        syscall
        j end_if                        # we don't want to execute the else statement part, so j"jump" to
                                        # "end_if" label to continue executing the rest of teh code after the else part
else_statm:                             
        li      $v0, 4                  
        la      $a0, else
        syscall
end_if:                                 # It will jump here to continue executing the code
        li      $v0, 4
        la      $a0, hello              # print "Hello again"
        syscall
        
        li      $v0, 10
        syscall