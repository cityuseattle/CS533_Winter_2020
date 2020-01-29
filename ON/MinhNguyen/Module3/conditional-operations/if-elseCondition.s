main:
        li  $t0, 0
        li  $t1, 1

        .data
if:     .asciiz "If \n"
else:   .asciiz "Else \n"
hello:  .asciiz "Hello again \n"
        .text

        bge     $t0, $t1, else_statm        # to check t0<t1, we use bge to return the else statement given below
                                            # if t0<t1, this line will be skipped and the code will continue below 
        
        li  $v0, 4      # The code from here is if statement
        la  $a0, if     
        syscall
        j end_if    # this help us skip the else_statm label below

else_statm:         # it will jump here if t0 >= t1
        li  $v0, 4
        la  $a0, else 
        syscall 
end_if:
        li  $v0, 4
        la  $a0, hello
        syscall 

        li  $v0, 10
        syscall 