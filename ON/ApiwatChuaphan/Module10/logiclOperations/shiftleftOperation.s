main:
    li      $t1, 7              # 7 = 111

    sll     $t2, $t1, 1         # shift left by 1, t2 = 1110

    li      $v0, 1
    move    $a0, $t2
    syscall

    li      $v0, 10
    syscall