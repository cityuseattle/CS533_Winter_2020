main:
    li      $t1, 7
    li      $t2, 5

    and     $t0, $t1, $t2

    li      $v0, 1
    move    $a0, $t0
    syscall

    li      $v0, 10
    syscall