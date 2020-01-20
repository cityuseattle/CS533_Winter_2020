main:
        li  $t0, 0  # t0=0
        li  $t1, 0  # t1=0

        .data
if:     .asciiz "If \n "  
else:   .asciiz "Else \n" 
hello:  .asciiz "Hello again \n "  
        .text

        bgt $t0, $t1 else_statm     # condition is true if t0 bigger than t1, so it will jump to
                                    # the "else-statement" label

        li  $v0, 4
        la  $a0, if 
        syscall
        j end_if

else_statm:                     # it jump here and execute the else because t0 is not <= t1
                                # then continue executing the code
        li  $v0, 4
        la  $a0, else
        syscall
end_if:
        li  $v0, 4
        la  $a0, hello          # print hello again
        syscall

        li  $v0, 10
        syscall
