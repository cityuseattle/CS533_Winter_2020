        .data
nl:     .asciiz "\n"
        .text

fact:
        beqz    $a0, return1                # check if a0=0, jump to return label to return 1

        li      $v0, 1                      # v0=1
        li      $t0, 1                      # t0=1  loop iterator
fact_loop:
        bgt     $t0, $a0, end_fact_loop     # check the condition, if true then jump to the end, else
                                            # continue executing the loop

        mul     $v0, $v0, $t0               # v0=v0 * t0

        addi    $t0, $t0, 1                 # t0++

        j       fact_loop                   # jump to fact_loop to check the condition

end_fact_loop:                              # jump here when the loop ends
        jr      $ra


return1:                                    # hump here if a0==0
        li      $v0, 1
        jr      $ra

main:
        li      $a0, $a0
        jal     fact                        # jump t fact func and sabve the address of next instruct in ra

        move    $t0, $v0                    # after the func ends, copy the returned value v0 of func into t0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 4                      # print string
        la      $a0, nl                     # a0= address of string nl
        syscall                             # print string that in a0

        li      $v0, 10
        syscall
