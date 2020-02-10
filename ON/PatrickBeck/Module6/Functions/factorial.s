                    .data
n1:                 .asciiz "\n"
msg:                .asciiz "Please enter a number: "
                    .text

displayMsg:
                    li        $v0, 4
                    la        $a0, msg
                    syscall
                    
                    jr        $ra

fact:
                    beqz      $a0, return1                  # check if a0=0, jump to return label to return 1

                    li        $v0, 1                        # v0=1
                    li        $t0, 1                        # t0=1 loop iterator

fact_loop:
                    bgt       $t0, $a0, end_fact_loop       # check the condition, if true then jump to the end, else
                                                            # continue executing the loop
                    
                    mul       $v0, $v0, $t0                 # v0=v0 *t0
                    
                    addi      $t0, $t0, 1                   # t0++

                    j         fact_loop                     # jump to fact_loop to check the condition

end_fact_loop:                                              # jump here when the loop ends
                    jr        $ra

return1:                                                    # hump here if a0==0
                    li        $v0, 1
                    jr        $ra

main:
                    li        $v0, 4                        # print string
                    la        $a0, msg                      # $a0= address of string msg
                    syscall

                    li        $v0, 5                        # receive input
                    syscall
                    move      $a0, $v0 

                    jal       fact                          # jump to fact func and save the address of next instruct in ra

                    move      $t0, $v0                      # after the func ends, copy the returned value v0 of func into t0

                    li        $v0, 1
                    move      $a0, $t0
                    syscall

                    li        $v0, 4                        # print string
                    la        $a0, n1                       # a0= address of string n1
                    syscall

############################################################# call the function again

                    li        $v0, 4                        # print string
                    la        $a0, msg                      # $a0 = address of string msg
                    syscall

                    li        $v0, 5                        # receive input
                    syscall
                    move      $a0, $v0 

                    jal       fact                          # jump to fact func and save the address of next instruct in ra

                    move      $t0, $v0                      # after the func ends, copy the returned value v0 of func into t0

                    li        $v0, 1                        # print integer
                    move      $a0, $t0                      # move the value of t0 into a0
                    syscall                                 # print the value of a0

                    li        $v0, 10
                    syscall