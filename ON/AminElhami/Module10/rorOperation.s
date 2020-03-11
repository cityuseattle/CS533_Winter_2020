main:
    li      $t1, 8     

    ror     $t2, $t1, 1 

    li      $v0, 1
    move    $a0, $t2
    syscall

    li      $v0, 10
    syscall 