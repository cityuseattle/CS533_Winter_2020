main:
        li      $t0, 2
        li      $t1, 5

        .data
ifs:    .asciiz "If \n"
else:   .asciiz "Else \n"
        .text

        ble     $t0, $t1, if        # if t0 < t1, jump to if label

        li      $v0, 4
        la      $a0, else           # If t0 >= t1, it will continue here and print else
        syscall
        j end_else                  # then jumpt to end_else label to exit    

if:                                 # if label
        add     $a0, $t0, $t1
        li      $v0, 1
        syscall

        li      $v0, 10
        syscall 

end_else:

        li      $v0, 10
        syscall 
