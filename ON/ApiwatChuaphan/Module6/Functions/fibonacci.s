            .data
answer:     .asciiz "The answer is: "
            .text
fibo:
    beqz    $a0, return0                # if a0 = 0, jump to return0
    beq     $a0, 1, return1             # if a0 = 1, jump to return1
    
    li      $v0, 0                      # a
    li      $v1, 1                      # b
    li      $t0, 0                      # loop iterator
    li      $t1, 0                      # c
    addi    $a0, $a0, -2                # n-2

fibo_loop:
    bgt     $t0, $a0, end_fibo_loop
    add     $t1, $v0, $v1
    move    $v0, $v1
    move    $v1, $t1

    addi    $t0, $t0, 1                 # t0++

    j       fibo_loop

end_fibo_loop:
    move    $v0, $t1
    jr      $ra

return0:
    li      $v0, 0
    jr      $ra

return1:
    li      $v0, 1
    jr      $ra

main:
    li      $a0, 16                     # a0 = 16 arg
    jal     fibo                        # call fact func
    move    $t0, $v0

    li      $v0, 4
    la      $a0, answer
    syscall

    li      $v0, 1
    move    $a0, $t0
    syscall

    li      $v0, 10
    syscall