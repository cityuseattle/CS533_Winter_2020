            .data
promt:      .asciiz "Enter an integer: "
respon:     .asciiz "You entered "
endl:       .asciiz "\n"
            .text

main:
            li $v0, 4       # string
            la $a0, promt
            syscall
            
            li $v0, 5       # input
            syscall
            move $t0, $v0

            li $v0, 4       # string
            la $a0, respon
            syscall

            li $v0, 1       # integer
            move $a0, $t0
            syscall

            li $v0, 4       # string
            la $a0, endl
            syscall

            li $v0, 10      # exit
            syscall