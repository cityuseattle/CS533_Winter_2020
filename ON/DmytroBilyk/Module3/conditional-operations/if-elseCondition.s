main:
        li  $t0, 0  # t0=0
        li  $t1, 1  # t1=1

        .data
if:     .asciiz "If \n "  
else:   .asciiz "Else \n" 
hello:  .asciiz "Hello again \n "  
        .text

        bge $t0, $t1 else_statm     # to check t0<t1, use bge so it returns true if(t0>=t1) and if in that case it will
                                    # jump to the else statement label because t0=t1

        li  $v0, 4
        la  $a0, if 
        syscall
        j end_if

else_statm:                     # it will jump here because t0=t1
                                # and it will continue executing the code
        li  $v0, 4
        la  $a0, else
        syscall
end_if:
        li  $v0, 4
        la  $a0, hello
        syscall

        li  $v0, 10
        syscall
