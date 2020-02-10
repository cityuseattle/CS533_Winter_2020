                    .data
msg:                .asciiz "Your answer is: "
                    .text

displayMsg:
                    li        $v0, 4
                    la        $a0, msg
                    syscall
                    
                    jr        $ra
                    
fact:
                    beqz      $a0, return1                  # check if a0=0, jump to return label to return 1
                    bne       $a0, 1, return2               # check if a0=1, jump to return label to return 2

                    li        $t1, 0                        # t1=0 int a
                    li        $t2, 1                        # t2=1 int b
                    li        $v0, 0                        # v0=0 int c
                    li        $t0, 1                        # t0=1 loop iterator


fact_loop:
                    bgt       $t0, $a0, end_fact_loop       # check the condition, if true then jump to the end, else
                                                            # continue executing the loop (i <= n)
                    
                    add       $v0, $t1, $t2                 # v0 = t1 + t2 (c = a+b)
                    move      $t1, $t2                      # move $t2 to $t1 (a = b)
                    move      $t2, $v0                      # move $v0 to $t2 (b = c)
                    
                    addi      $t0, $t0, 1                   # t0++
                    sub       $a0, $a0, 2                   # $a0 = $a0-2 (i<= n-2)
                    

                    j         fact_loop                     # jump to fact_loop to check the condition

end_fact_loop:                                              # jump here when the loop ends
                    jr        $ra

return1:                                                    # jump here if a0==0
                    li        $v0, 1
                    jr        $ra

return2:                                                    # jump here if a0==1
                    li        $v0, 1                        
                    jr        $ra 

main:
                    li        $a0, 16                       # a0=16
                    jal       fact                          # jump to fact func and save the address of next instruct in ra

                    move      $t0, $v0                      # after the func ends, copy the returned value v0 of func into t0

                    jal       displayMsg

                    li        $v0, 1                        # print integer
                    move      $a0, $t0                      # move the value of t0 into a0
                    syscall                                 # print the value of a0

                    li        $v0, 10
                    syscall

                    