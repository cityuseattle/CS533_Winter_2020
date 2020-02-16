        .data
nl:     .asciiz "\n"
        .text

fact:
        beqz    $a0, return1    # check if a0=0, jump to return label to return1

        li      $v0, 1          # v0=1
        li      $t0, 1          # t0=1 loop iterator

fact_loop:
        bgt     $t0, $a0, end_fact_loop

        mul     $v0, $v0, $t0

        addi    $t0, $t0, 1

        j       fact_loop       # jump to fact loop to check the condition

end_fact_loop:
        jr      $ra

return1:
        li      $v0, 1
        jr      $ra

main:
        li      $a0, 6          
        jal     fact

        move    $t0, $v0

        li      $v0, 1          # sys code for printing integer
        move    $a0, $t0        # move the value of v1 into a0
        syscall

        li      $v0, 4
        la      $a0, nl
        syscall
        
################################# call the function again

        li      $a0, 7
        jal     fact

        move    $t0, $v0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li  $v0, 10
        syscall