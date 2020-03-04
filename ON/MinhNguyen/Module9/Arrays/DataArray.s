        .data
list:   .word 3, 4, 5, 6
        .text

main:
        la      $t0, list       # load list[0] to t0


        lw      $t1, 4($t0)     # t1 = 2nd element in the array 

        li      $v0, 1
        move    $a0, $t1        # a0 = t1
        syscall

        li      $v0, 10
        syscall