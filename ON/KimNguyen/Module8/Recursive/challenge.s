        .data
msg:    .asciiz "The answer of b^e is: "
prompt1:.asciiz "Enter the base: "
prompt2:.asciiz "Enter the exponent: "
        .text

power:
        bne $a1, $zero, recursion   #if the power is greater than 1, jump to recursion label
        li  $v0, 1                  #otherwise return 1
        jr  $ra

recursion:
        addi    $sp, $sp, -4        # allocate space for one integer on the stack
        sw      $ra, 0($sp)         # store return addr on the stack
        addi    $a1, $a1, -1        #decrease power by 1
        jal     power               #call power func
        mul     $v0, $a2, $v0       #mul result by the base and save it as new res
        lw      $ra, 0($sp)         #store return address from stacak
        addi    $sp, $sp, 4         #deallocate stack memory
        jr      $ra                 #return to calling func

main:
        #challenge: take user input: base 5; expo: 3
        li $v0, 4 
        la $a0, prompt1             #prompt to take input of base
        syscall

        li $v0, 5 
        syscall
        move $a2, $v0                #store input in a2

        li $v0, 4 
        la $a0, prompt2              #prompt to take input of expo
        syscall

        li $v0, 5 
        syscall
        move $a1, $v0                 #store input in a2

        jal       power               #compute

        move    $t0, $v0

        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall                        #display result

        li      $v0, 10
        syscall