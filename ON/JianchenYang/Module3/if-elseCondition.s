main:
        li $t0, 0
        li $t1, 1

        .data
if:     .asciiz "If "
else:   .asciiz "Else \n"
hello:  .asciiz "Hello again \n"
        .text

        bge  $t0, $t1, else_statm

        li $v0, 4
        la $a0, if
        syscall
        j end_if

else_statm:
        li $v0, 4
        la $v0, hello
        syscall

end_if:

        li $v0, 4
        la $a0, hello
        syscall

        li $v0, 10
        syscall