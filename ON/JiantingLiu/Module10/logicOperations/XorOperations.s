main:
    li  $t1, 7              # 7 == 111
    li  $t2, 5              # 5 == 101

    xor $t0, $t1, $t2       # 111 and 101 = 101 = 5

    li  $v0, 1
    move    $a0, $t0
    syscall

    li  $v0, 10,
    syscall