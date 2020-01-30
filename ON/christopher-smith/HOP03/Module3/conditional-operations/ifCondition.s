main:
        li  $t0, 0                  # t0=0
        li  $t1, 1                  # t1=1

        .data
hello:  .asciiz "Hello "            # Hello string
world:  .asciiz "World \n"          # world string 
        .text

        bne $t0, $t1, print_hello   # bne"branch not equat" condition will be false because t0=t1
                                    # so it will continue executing the code and no jump to anywhere 
        li  $v0, 4
        la  $a0, hello
        syscall

print_world:                        # The bne condition is true, so it jumps here "print_world" label to
                                    # execute the code 
        li  $v0, 4
        la  $a0, world
        syscall

        li  $v0, 10
        syscall 