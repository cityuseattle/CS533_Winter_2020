main:
        li  $t0, 0
        li  $t1, 1


        .data
hello:   .asciiz "Hello "
world:   .asciiz "World \n"
        .text

        bne $t0, $t1, print_world


        li  $v0, 4
        la  $a0, hello
        syscall

print_world:

        li  $v0, 4
        la  $a0, world
        syscall

        li $v0, 10
        syscall