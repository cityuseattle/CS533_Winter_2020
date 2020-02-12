        .data
ya:     .asciiz "Your answer is: "
        .text

fact:
        beqz    $a0, return1            # if a0 = 0, jump to return 1
        
        li      $v0, 1                  # v0 =1
        li      $t0, 1                  # to =1
fact_loop:
        bgt     $t0, $a0, end_fact_loop # check the condition, if true then jump to end
                                        # else, continue
        
        mul     $v0, $v0, $t0           # v0 = v0*t0

        addi    $t0, $t0, 1             # t0++

        j       fact_loop               # jump to fact_loop to check conditon

end_fact_loop:
        jr      $ra


return1:
        li      $v0, 1   
        jr      $ra


main:
        li      $v0, 5                  #read  integer input value
        syscall                         # call
        move    $a0, $v0                # store value in a0
        jal     fact                    # jump and link a0 parameter to fact function

        move    $t0, $v0                # move the result to t0

        li      $v0, 4                  # print string call
        la      $a0, ya
        syscall

        li      $v0, 1
        move    $a0, $t0                # print t0
        syscall 

        li      $v0, 10                 # exit
        syscall