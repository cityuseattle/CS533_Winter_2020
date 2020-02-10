                    .data
msg:                .asciiz "Your answer is: "
                    .text

displayMsg:
                    li        $v0, 4
                    la        $a0, msg
                    syscall
                    
                    jr        $ra
                    
needsTemps:
                    add       $t0, $a0, $a1       # $t0 = $t1 + $t2
                    sub       $t1, $a0, $a1       # $t1 = $t1 - $t2
                    mult      $t0, $t1            # $t0 * $t1 = Hi and Lo registers
                    mflo      $t2                 # copt Lo to $t2
                    move      $v0, $t2            # v0 contains the returing value of the function
                    jr        $ra                 # jump to the address that saved in $ra

main:
                    jal       displayMsg

                    li        $a0, 10             # a0=10 func's argument
                    li        $a1, 8              # a1=8 func's argument
                    jal       needsTemps          # call the func needsTemps and save the address of
                                                  # next instruction in register $ra

                    move      $t0, $v0            # copy the returned value of the function v0 into t0

                    li        $v0, 1              # print an integer
                    move      $a0, $t0            # copy the value of t0 into a0
                    syscall

                    li        $v0, 10             # end of the program
                    syscall