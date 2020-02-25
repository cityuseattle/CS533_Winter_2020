        .data
msg:    .asciiz "The answer of b^e is: "
input1: .asciiz "Enter the base: "
input2: .asciiz "Enter the exponent: "
newLine:.asciiz "\n"
        .text

power:
        bne     $a1, $zero, recursion
        li      $v0, 1
        jr      $ra

recursion:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
        addi    $a1, $a1, -1
        jal     power
        mul     $v0, $a0, $v0
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra

main:

        li      $v0, 4
        la      $a0, input1
        syscall

        li      $v0, 5
        syscall
        move    $t0, $v0                #copying v0 to t0 ; t0=v0

        li      $v0, 4
        la      $a0, newLine
        syscall

        
        li      $v0, 4
        la      $a0, input2
        syscall

        li      $v0, 5
        syscall
        move    $a1, $v0                 #copying v0 to a1 ; a1=v0
        move    $a0, $t0                 #copying t0 to a0 ; a1=v0  

        jal     power

        move    $t0, $v0

        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall

        li  $v0, 10
        syscall