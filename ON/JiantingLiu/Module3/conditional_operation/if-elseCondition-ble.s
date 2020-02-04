main:
        li $t0, 5
        li $t1, 0

        .data
g:      .asciiz "Greater \n"
ng:     .asciiz "Not greater \n"
hello:  .asciiz "Hello again \n"
        .text

        ble $t0, $t1, else_statm
        li $v0, 4
        la $a0, g
        syscall
        j end_if

else_statm:

        li $v0, 4
        la $a0, ng
        syscall
end_if:
        li $v0, 4
        la $a0, hello
        syscall

        li $v0, 10
        syscall