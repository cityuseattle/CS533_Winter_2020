        .data
one:    .asciiz "This is string one \n"
two:    .asciiz "This is strong two"
        .text
main:
        li  $v0, 4
        la  $a0, one
        syscall

        la $a0, two
        syscall
        
        li $v0, 10
        syscall