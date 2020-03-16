    .data
nl: .asciiz "\n"
    .text

main:
    li      $t0, 7          # binary 7 = 111

    andi    $t1, $t0, 5     # 111 and 101 = 101 = 5 in decimal

    li      $v0, 1
    move    $a0, $t1        # move t1 to a0 for printing
    syscall

    li      $v0, 4
    la      $a0, nl         # print n1 string
    syscall

    xori    $t1, $t0, 5     # 111 xor 101 = 111 = 2 in decimal

    li      $v0, 1
    move    $a0, $t1        # move t1 to a0 for printing
    syscall

    ori     $t1, $t0, 5     # 111 or 101 = 111 = 7 in decimal

    li      $v0, 1
    move    $a0, $t1        # move t1 to a0 for printing
    syscall

    li      $v0, 4
    la      $a0, nl         # print n1 string
    syscall

    li      $v0, 10
    syscall
