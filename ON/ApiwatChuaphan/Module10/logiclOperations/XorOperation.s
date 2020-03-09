main:
    li  $t1, 7              # 7 == 111 in binary
    li  $t2, 5              # 5 == 101

    xor $t0, $t1, $t2       # 111 xor 101 = 010 = 2

    li  $v0, 1
    move    $a0, $t0
    syscall

    li  $v0, 10,
    syscall