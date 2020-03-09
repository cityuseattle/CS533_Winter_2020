        .data
array1: .space  20
        .text

main:
        la      $t0, array1

        li      $t1, 3
        sw      $t1, ($t0)

        li      $t1, 5
        sw      $t1, 4($t0)

        li      $t1, 6
        sw      $t1, 8($t0)

        li      $t1, 8
        sw      $t1, 12($t0)

        li      $t1, 10
        sw      $t1, 16($t0)

        li      $v0, 1
        lw      $a0, 8($t0)
        syscall

        li      $v0, 10
        syscall