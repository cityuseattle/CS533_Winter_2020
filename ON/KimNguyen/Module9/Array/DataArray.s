        .data
list:   .word 3, 4, 5, 6
        .text

main:
    la      $t0, list

    lw      $t1, 4($t0)

    li      $v0, 1
    move    $a0, $t1
    syscall

    li      $v0, 10
    syscall