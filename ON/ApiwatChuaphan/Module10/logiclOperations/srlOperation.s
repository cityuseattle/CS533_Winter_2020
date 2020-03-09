main:
    li      $t1, 7              # 7 = 111

    srl     $t2, $t1, 1         # shift right by 1, t2 = 011

    li      $v0, 1
    move    $a0, $t2
    syscall

    li      $v0, 10
    syscall