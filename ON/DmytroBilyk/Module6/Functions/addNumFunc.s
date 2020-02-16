addNums:
        add     $v1, $a0, $a1   # v1=a0+a1 v1 is your return value
        jr      $ra             # jump to the next instruction of jal addNums

main:
        li      $a0, 6          # a0=6 func's argument
        li      $a1, 9          # a1=9 func's argument
        jal     addNums         # call the func addNums and save the address of next
                                # instruction in $ra

        li      $v0, 1          # sys code for printing integer
        move    $a0, $v1        # move the value of v1 into a0
        syscall

        li  $v0, 10
        syscall