main: 
        li      $t0, 0                      # t0=0
        li      $t1, 1                      # t1=1

         .data
g:       .asciiz "Greater or equal \n "
ng:      .asciiz "Not Greater or equal \n"
hello:   .asciiz "Hello again \n"
         .text

        blt     $t0, $t1, else_statm        # This condition is true because t0<t1, so it will jump to else statement


        li      $v0, 4
        la      $a0, g 
        syscall
        j  end_if

else_statm:                                 # It will jump here because t0 is not >= to t1

        li      $v0, 4
        la      $a0, ng
        syscall
end_if:
        li      $v0, 4
        la      $a0, hello                  $ print "Hello again" 
        syscall

        li $v0,10
        syscall