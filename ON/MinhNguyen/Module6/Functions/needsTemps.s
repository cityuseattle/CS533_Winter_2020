        .data
ans:    .asciiz "Your answer = "
        .text

needsTemps:
        add     $t0, $a0, $a1   # t0 = a0 + a1
        sub     $t1, $a0, $a1   # t1 = a0 - a1
        mult    $t0, $t1        # t0 * t1 = Hi and Lo registers
        mflo    $t2             # copy Lo to t2
        move    $v0, $t2        # move t2 to v0
        jr      $ra             # jump to the address that save in ra

main:
        li      $a0, 10         # a0 = 10
        li      $a1, 8          # a1 = 8
        jal     needsTemps      # call function needsTemps and save the address
                                # of the next instruction in $ra
        
        move    $t0, $v0        # move v0 into t0

        li      $v0, 4          # print string call
        la      $a0, ans
        syscall

        li      $v0, 1          # print int call
        move    $a0, $t0        # move t0 to ao to print
        syscall                 # print

        li      $v0, 10         # exit
        syscall 