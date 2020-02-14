            .data
promt:      .asciiz "Enter an integer: "
n1:         .asciiz "\n"
            .text
fact:
    beqz    $a0, return1                # if z0 = 0, jump to return1
    
    li      $v0, 1
    li      $t0, 1

fact_loop:
    bgt     $t0, $a0, end_fact_loop
    mul     $v0, $v0, $t0
    addi    $t0, $t0, 1                 # t0++
    j       fact_loop

end_fact_loop:
    jr      $ra

return1:
    li      $v0, 99
    jr      $ra

main:
    li $v0, 4                           # string
    la $a0, promt
    syscall
            
    li $v0, 5                           # user input
    syscall
    move $a0, $v0

    jal     fact                        # call fact func
    move    $t0, $v0

    li      $v0, 1
    move    $a0, $t0
    syscall

    li      $v0, 4
    la      $a0, n1
    syscall

    li $v0, 4                           # string
    la $a0, promt
    syscall
            
    li $v0, 5                           # user input
    syscall
    move $a0, $v0

    # li      $a0, 7                      # a0 = 7 arg
    jal     fact                        # call fact func
    move    $t0, $v0

    li      $v0, 1
    move    $a0, $t0
    syscall

    li      $v0, 10
    syscall