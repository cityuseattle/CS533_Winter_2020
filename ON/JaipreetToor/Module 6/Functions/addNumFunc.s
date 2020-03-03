addNums:
    add     $v1, $a0, $a1    # v1 = a0 + a1
    jr      $ra

main:
    li      $a0, 6           # a0 = 6 arg
    li      $a1, 9           # a1 = 9 arg
    jal     addNums         # call; func and save addr of next instruction in $ra

    li      $v0, 1           
    move    $a0, $v1
    syscall

    li      $v0, 10
    syscall