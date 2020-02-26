 .data
base:   .asciiz "Enter the base number: "
expo:   .asciiz "Enter the exponent number: "
ans:    .asciiz "The answer of base^exponent is: "
        .text

power:
        bne $a2, $zero, recursion
        li  $v0, 1
        jr  $ra

recursion:
        addi    $sp, $sp, -4        # space for one integer on  stack
        sw      $ra, 0($sp)         # store  addr on  stack
        addi    $a2, $a2, -1        # power-1
        jal     power               # call funnction again
        mul     $v0, $a1, $v0       # multiplyresult by base
        lw      $ra, 0($sp)         # store result on stack
        addi    $sp, $sp, 4         # deallocate
        jr      $ra

main:
        li      $v0, 4              # base number input message
        la      $a0, base
        syscall

        li      $v0, 5              # user input base number
        syscall
        move    $a1, $v0            # store user input in a1

        li      $v0, 4              # prompt expo number
        la      $a0, expo
        syscall

        li      $v0, 5              # user input base number
        syscall
        move    $a2, $v0            # store in a2

        jal     power               

        move    $t0, $v0

        li      $v0, 4              # print final message
        la      $a0, ans
        syscall

        li      $v0, 1              # print result
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall