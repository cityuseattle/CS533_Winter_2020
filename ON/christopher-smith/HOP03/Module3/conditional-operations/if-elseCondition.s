main: 
        li      $t0, 0                      # t0=0
        li      $t1, 1                      # t1=1

         .data
if:      .asciiz "If \n "
else:    .asciiz "Else \n"
hello:   .asciiz "Hello again \n"
         .text

        bge     $t0, $t1, else_statm        # to check t0<t1, use bge so it return true if (t0>t1) and in that case it will
                                            # jump to the else statement label because t0=t1

        li      $v0, 4
        la      $a0, if                     # if will print "if" here
        syscall
        j  end_if                           # we don't want to execute the else statement part, so j"jump"to
                                            # "end_if" label to continue executing the code after the else part

else_statm:                                 
        li      $v0, 4                      
        la      $a0, else
        syscall 
end_if:
        li      $v0, 4
        la      $a0, hello                  # print "Hello again" 
        syscall

        li $v0,10
        syscall

        