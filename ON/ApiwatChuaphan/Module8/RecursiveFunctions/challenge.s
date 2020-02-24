        .data
base:   .asciiz "Enter the base: "
expo:   .asciiz "Enter the exponent: "
ans:    .asciiz "The answer of b^e is: "
        .text

power:
        bne $a2, $zero, recursion
        li  $v0, 1
        jr  $ra

recursion:
        addi    $sp, $sp, -4        # allocate space for one integer on the stack
        sw      $ra, 0($sp)         # store return addr on the stack
        addi    $a2, $a2, -1        # decrease the power by one
        jal     power               # call func with new parameter
        mul     $v0, $a1, $v0       # multiply the result by base
        lw      $ra, 0($sp)         # store result addr from stack
        addi    $sp, $sp, 4         # deallocate
        jr      $ra

main:
        li      $v0, 4              # prompt for base number
        la      $a0, base
        syscall

        li      $v0, 5              # user input base number
        syscall
        move    $a1, $v0            # store it into a1

        li      $v0, 4              # prompt for expo number
        la      $a0, expo
        syscall

        li      $v0, 5              # user input base number
        syscall
        move    $a2, $v0            # store it into a2

        # li      $a0, 5
        # li      $a1, 3
        jal     power               # 5 ^ 3

        move    $t0, $v0

        li      $v0, 4              # print the message for result
        la      $a0, ans
        syscall

        li      $v0, 1              # print actual result of power
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall
