.data
nl:     .asciiz "\n"
        .text

main:
        li      $t0, 2          # t0 = 2
        li      $t1, 7          # t1 = 7
        li      $t2, 5          # t2 = 5
        li      $t3, 8          # t3 = 8

        add     $a0, $t0, $t3   # a0 = t0 + t3
        li      $v0, 1          # print int
        syscall

        li      $v0, 4
        la      $a0, nl         # print new line
        syscall

        add     $a0, $t2, 17    # a0 = t2 + 17
        li      $v0, 1          # print int
        syscall

        li      $v0, 4
        la      $a0, nl         # print new line
        syscall

        sub     $a0, $t0, $t1   # a0 = t0 - t1
        li      $v0, 1          # print int
        syscall

        li      $v0, 4
        la      $a0, nl         # print new line
        syscall

        mult    $t1, $t2        # size of one reg is 32 bits, then multiplication of 2 reg are 64 bits
                                # the result will be saved into 2 regs [Hi Lo]
        mflo    $a0             # we mult small numbers so we used mflo to see the result, a0 = t1 * t2
        li      $v0, 1          # print int
        syscall

        li      $v0, 4
        la      $a0, nl         # print new line
        syscall

        div     $t1, $t2        # Hi = remainder, lo = quotient = t1 / t2
        mflo    $a0             # a0 = t1 / t2
        li      $v0, 1          # print int
        syscall

        li      $v0, 4
        la      $a0, nl         # print new line
        syscall

        mfhi    $a0             # mfhi will copy the remainder of the div op of t1/t2 value into a0
        li      $v0, 1          # print int
        syscall

        li      $v0, 4
        la      $a0, nl         # print new line
        syscall

        rem     $a0, $t1, $t0   # another way to get the remainder a0 = t1 % t0
        li      $v0, 1          # print int
        syscall

        li      $v0, 4
        la      $a0, nl         # print new line
        syscall

        li      $v0, 10
        syscall