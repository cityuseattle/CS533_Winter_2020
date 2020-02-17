        .data
msg:    .asciiz "The answer of b^e is: "
        .text

power:
        bne $a1, $zero, recursion
        li  $v0, 1
        jr  $ra

recursion:
        addi    $sp, $sp, -4        # allocate space for one integer on the stack
        sw      $ra, 0($sp)         # store return addr on the stack
        addi    $a1, $a1, -1
        jal     power
        mul     $v0, $a0, $v0
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra

main:
        li      $a0, 5
        li      $a1, 3
        jal     power

        move    $t0, $v0

        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall
