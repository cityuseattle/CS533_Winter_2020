main:
     li $t0, 0
     li $t1, 0

     .data
hello: .asciiz "Hello "
world: .asciiz "World \n"
    .text

    beq $t0, $t1, target

    li $v0, 4
    la $a0, hello
    syscall

    target: 
        li $v0, 4
        la $a0, world
        syscall

    li $v0, 10
    syscall  