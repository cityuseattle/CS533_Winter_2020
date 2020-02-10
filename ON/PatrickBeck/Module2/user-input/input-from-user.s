        .data
prompt: .asciiz "Enter an integer: "
respon: .asciiz "You entered "
endl:   .asciiz "\n"
        .text

main:
        li      $v0, 4          # print string
        la      $a0, prompt     # load address of string prompt
        syscall                 # print string

        li      $v0, 5          # read input into register
        syscall
        move    $t0, $v0        # copy the value of $v0 into $t0

        li      $v0, 4          # print string
        la      $a0, respon     # load address of string respon
        syscall                 # print string

        li      $v0, 1          # print integer
        move    $a0, $t0        # copy the value of $t0 to $a0
        syscall                 # print the value of a0
        
        li      $v0, 4          # print string
        la      $a0, endl       # load address of string endl
        syscall                 # print string

        li      $v0, 10
        syscall
        