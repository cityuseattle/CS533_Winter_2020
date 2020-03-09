        .data
base:   .asciiz "Enter the base: "
exp:    .asciiz "\nEnter the exponent: "
msg:    .asciiz "\nThe answer of b^e is: "
        .text

power:
        bne		$a1, $zero, recursion       # if the power is greater than 1, jump to recursion label
        li		$v0, 1                      # otherwise return 1
        jr		$ra					        # jump to $ra

recursion:
        addi	$sp, $sp, -4                # allocate space for one integer on stack
        sw      $ra, 0($sp)                 # store return address on stack
        addi    $a1, $a1, -1                # decrease power by 1
        jal		power				        # call power func with new parameter
        mul     $v0, $a0, $v0               # mult result by base & save as the new res
        lw		$ra, 0($sp)                 # store return address on stack
        addi    $sp, $sp, 4                 # deallocate
        jr      $ra                         # return to the calling function

main:
        li  $v0, 4
        la	$a0, base
        syscall

        li	$v0, 5
        syscall
        add    $a0, $v0, $zero             # a0 = v0

        li  $v0, 4
        la	$a0, exp
        syscall

        li	$v0, 5
        syscall
        add     $a1, $v0, $zero             # a1 = v0

        #li      $a0, 5
        #li      $a1, 3
        jal     power                       # compute 5^3

        move 	$t0, $v0

        li      $v0, 4
        la		$a0, msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall