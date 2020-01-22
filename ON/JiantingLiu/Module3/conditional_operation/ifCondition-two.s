main:
        li  $t0, 0
        li  $t1, 1


        .data
hello:  .asciiz "Hello "
world:  .asciiz "World \n"
        .text

        beq $t0, $t1, end_if       #if $t0 not equal to $t1 
                                   #the program will continue and keep reading the rest code
                                   #the out put will be Hello World


        li  $v0, 4
        la  $a0, hello
        syscall

end_if:

        li  $v0, 4
        la  $a0, world
        syscall

        li $v0, 10
        syscall