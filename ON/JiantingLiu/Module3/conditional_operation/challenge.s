main:
        li  $t0, 2;
        li  $t1, 5;
        
        bgt $t1,$t0, if
        li  $v0, 10
        syscall
if:
        li  $v0, 1
        add $a0, $t0,$t1
        syscall

        li  $v0, 10
        syscall