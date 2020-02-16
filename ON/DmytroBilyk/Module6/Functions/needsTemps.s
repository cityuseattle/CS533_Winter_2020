needsTemp:
        add     $t0, $a0, $a1   # t0 = t1+t2           
        sub     $t1, $a0, $a1   # t1 = t1-t2
        mult    $t0, $t1        # t0 * t1 = hi and lo registers
        mflo    $t2             # copy lo to t2
        move    $v0, $t2        # v0 contain the returning value of the function
        jr      $ra             # jump to the address that saved in ra

main:
        li      $a0, 10          
        li      $a1, 8          
        jal     needsTemp

        move    $t0, $v0

        li      $v0, 1          # sys code for printing integer
        move    $a0, $t0        # move the value of v1 into a0
        syscall

        li  $v0, 10
        syscall