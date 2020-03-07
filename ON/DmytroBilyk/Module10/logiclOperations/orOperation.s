main:
    li  $t1, 7      # binary equivalent of 7=111
    li  $t2, 5      # binary equivalent of 5=101

    or $t0, $t1, $t2   # 111 or 101 = 111 = 7 decimal

    li  $v0, 1
    move $a0, $t0
    syscall

    li  $v0, 10
    syscall
    