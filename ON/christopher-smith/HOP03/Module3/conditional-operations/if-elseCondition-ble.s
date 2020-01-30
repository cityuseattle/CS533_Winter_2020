main: 
        li      $t0, 1                          # t0=1
        li      $t1, 0                          # t1=0

         .data
g:       .asciiz "Greater \n"
ng:      .asciiz "Not Greater \n"
hello:   .asciiz " Hello again \n"
         .text

        ble     $t0, $t1, else_statm            # This condition is true because t0>t1, so it will jump to else_statm label


        li      $v0, 4
        la      $a0, g 
        syscall
        j  end_if

else_statm:                                     # It will jump here because t0 is > t1

        li      $v0, 4
        la      $a0, g                        # load the address of the ng string in a0
        syscall                               # print the string in a0
end_if:
        li      $v0, 4
        la      $a0, hello                      # print "Hello again" 
        syscall

        li $v0,10
        syscall


