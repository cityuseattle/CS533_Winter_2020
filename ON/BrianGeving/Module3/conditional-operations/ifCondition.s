main:
        li $t0, 0                        #t0=0
        li $t1, 0                        #t1=0

        .data
hello:  .asciiz "Hello "                 #hello string
world:  .asciiz "World \n"               #world string
        .text

        bne $t0, $t1, print_world       #branch to print_world if t1!=t0

        li $v0, 4
        la $a0, hello
        syscall

print_world:                            #jump here if bne is true
        li $v0, 4
        la $a0, world
        syscall

        li $v0, 10
        syscall
