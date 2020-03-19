        .data
nl:     .asciiz "\n"
        .text

main:

    li      $t0, 7          # binary equivalent of 7 = 111

    andi    $t1, $t0, 5     # 111 and 101 = 101 = 5 in decimal

    li      $v0, 1
    move    $a0, $t1        # load t1 into a0 to be printed
    syscall

    li      $v0, 4
    la      $a0, nl         # load the address of nl into a0
    syscall


    xori    $t1, $t0, 5     # 111 xor 101 = 111 = 2 in decimal

    li      $v0, 1
    move    $a0, $t1        # load t1 into a0 to be printed
    syscall

    li      $v0, 4
    la      $a0, nl         # load the address of nl into a0
    syscall

    ori     $t1, $t0, 5     # 111 or 111 = 111 = 7 in decimal

    li      $v0, 1
    move    $a0, $t1        # load t1 into a0 to be printed
    syscall
    
    li      $v0, 4
    la      $a0, nl         # load the address of nl into a0
    syscall

    li $v0, 10
    syscall