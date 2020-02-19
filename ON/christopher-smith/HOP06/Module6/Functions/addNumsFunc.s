addNums:
         add    $v1, $a0, $a1           # v1=a0+a1  v1 is your return value
         jr     $ra                     # jump to the next instruction of jal addNums

main:
         li     $a0, 6                  # a0=6  func's argument
         li     $v0, 1                  # a1=9  func's argument
         jal    addNums                 # call the func addNums and save the address of next
                                        # instruction in $ra

         li     $v0, 1                  # sys code for printing integer
         move   $a0, $v1                # move the value that exit in a0
         syscall                        # print the value that exit in a0

         li     $v0, 10                 # end of your program
         syscall
