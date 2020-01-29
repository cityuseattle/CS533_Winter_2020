main:
        li      $t0, 0
        li      $t1, 0

        .data
if:     .asciiz "If \n"
else:   .asciiz "Else \n"
hello:  .asciiz "Hello again \n"
        .text

        bgt     $t0, $t1, else_statm        #condition is true if t0>t1, else_statm label will be processed
                                            #continue if not


        li      $v0, 4
        la      $a0, if 
        syscall
        j  end_if

else_statm:                                 # else_statm label
        li      $v0, 4
        la      $a0, else 
        syscall
end_if:
        li      $v0, 4
        la      $a0, hello                  # string hello
        syscall 

        li $v0, 10
        syscall 