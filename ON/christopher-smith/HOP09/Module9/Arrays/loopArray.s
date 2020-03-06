            .data
arr:        .word 3, 2, 1, 8, 6
            .text

main:
            la      $t1, arr
            li      $t0, 0              # loop iterator

loop1:
            bge     $t0, 5, exit        # 5 is the size of the array
            lw      $t2, 0($t1)
            addi    $t1, $t1, 4         # load word from addrs and goes to the next addrs

            li      $v0, 1
            move    $a0, $t2
            syscall                     # syscall to print value

            li      $v0, 11
            li      $a0, 32
            syscall                     # optional - syscall number for printing characters (space)

            addi    $t0, $t0, 1
            j       loop1               # increment counter

exit:
            li      $v0, 10
            syscall
