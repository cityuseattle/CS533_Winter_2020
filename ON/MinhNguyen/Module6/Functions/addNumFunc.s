addNums:
        add     $v1, $a0, $a1   # load result to v1, v1 = a0 + a1
        jr      $ra             # jump to the next instruction of jal addNums

main:
        li      $a0, 6          # load a0, a0 is previously registered as the function argument
        li      $a1, 9          # the same with a0
        jal     addNums         # jump and link to function


        li      $v0, 1          # print integer call
        move    $a0, $v1        # load result v1 to a0
        syscall                 # print

        li      $v0, 10         # exit
        syscall