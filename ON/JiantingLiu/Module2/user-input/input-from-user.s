        .data
prompt: .asciiz "Enter an integer: "
respon: .asciiz "You entered "
endl:   .asciiz "\n"
        .text


main:
        li $v0,4
        la $a0, prompt
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0, 4
        la $a0, respon
        syscall

        li $v0, 4
        la $a0, endl
        syscall

        li $v0, 10
        syscall
