                .data
zero_string:    .asciiz "Choice is 0 \n"
one_string:     .asciiz "Choice is 1 \n"
two_string:     .asciiz "Choice is 2 \n"
fifty_string:   .asciiz "Choice is 50 \n"
Def_string:     .asciiz "Print Default \n"
                .text

main:
        li      $v0, 5
        syscall
        move    $t0, $v0

        beq     $t0, $zero, zero
        beq     $t0, 1, one
        beq     $t0, 2, two
        beq     $t0, 50, fifty
        j       Default

zero:    
        li      $v0, 4
        la      $a0, zero_string
        syscall
        j       end_case

one:    
        li      $v0, 4
        la      $a0, one_string
        syscall
        j       end_case

two:    
        li      $v0, 4
        la      $a0, two_string
        syscall
        j       end_case

fifty:    
        li      $v0, 4
        la      $a0, fifty_string
        syscall
        j       end_case

Default:    
        li      $v0, 4
        la      $a0, Def_string
        syscall
        j       end_case

end_case:
        li      $v0, 10
        syscall