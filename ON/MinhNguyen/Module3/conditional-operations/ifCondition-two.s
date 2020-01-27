main:
        li  $t0, 0
        li  $t1, 1

        .data
hello:  .asciiz "Hello "
world:  .asciiz "World \n"
        .text

        beq     $t0, $t1, end_if        # The end_if label will be execute if the condition met
                                        # and the hello string below will be skipped
                                        # if the condition is False, the branch will be skipped

        li      $v0, 4
        la      $a0, hello 
        syscall

end_if:

        li  $v0, 4
        la  $a0, world
        syscall 

        li $v0, 10
        syscall 