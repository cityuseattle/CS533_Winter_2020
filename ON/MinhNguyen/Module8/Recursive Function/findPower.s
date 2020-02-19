        .data
msg:    .asciiz "The answer of b^e is: "
base:   .asciiz "Enter the base: "
ex:     .asciiz "Enter the exponent: "
        .text 

power:
        bne     $a1, $zero, recursion   # if the power is greater than 1, jump to recursion
        li      $v0, 1                  # otherwise return 1             
        jr      $ra 

recursion:
        addi    $sp, $sp, -4            # Allocate space for one integer on the stack
        sw      $ra, 0($sp)
        addi    $a1, $a1, -1
        jal     power 
        mul     $v0, $a0, $v0 
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra

main:   
        li      $v0, 4          #load string labels
        la      $a0, base
        syscall

        li      $v0, 5          #read input value
        syscall
        move    $a2, $v0

        li      $v0, 4          #load string labels
        la      $a0, ex
        syscall

        li      $v0, 5          #read input value
        syscall
        move    $a3, $v0

        move    $a0, $a2
        move    $a1, $a3
        jal     power           # call function

        move    $t0, $v0 

        li      $v0, 4
        la      $a0, msg 
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall 

        li      $v0, 10
        syscall