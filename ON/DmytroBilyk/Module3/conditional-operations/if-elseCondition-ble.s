main:
        li  $t0, 1 
        li  $t1, 0  

        .data
g:     .asciiz "Greater \n "  
ng:   .asciiz "Not Greater \n" 
hello:  .asciiz "Hello again \n "  
        .text

        ble $t0, $t1 else_statm     # This condition is true because t0<t1, so it will jump to else statement

        li  $v0, 4
        la  $a0, g 
        syscall
        j end_if

else_statm:                     # it will jump here because t0 is not >= to t1
        li  $v0, 4
        la  $a0, ng
        syscall
end_if:
        li  $v0, 4
        la  $a0, hello          # print hello again
        syscall

        li  $v0, 10
        syscall
