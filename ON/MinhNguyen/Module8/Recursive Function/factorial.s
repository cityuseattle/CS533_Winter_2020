        .data
prompt: .asciiz "Input an ineger x:\n"
result: .asciiz "Fact(x) = "
        .text 

factorial:
    # base case -- still in parent's stack segment
    # adjust stack pointer to store return address and argument
    addi    $sp, $sp, -8
    # save $s0 and $ra
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    bne     $a0, 0, else
    addi    $v0, $zero, 1
    j   fact_return 

else:
    # backup $a0
    move    $s0, $a0
    addi    $a0, $a0, -1
    jal     factorial

    multu   $s0, $v0 
    mflo    $v0 
fact_return:
    lw      $s0, 4($sp) 
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra 

main:
    li      $v0, 4      # print string call
    la      $a0, prompt
    syscall

    li      $v0, 5      # read input
    syscall 

    move    $a0, $v0    # store input to a0
    jal     factorial   # call function
    move    $t0, $v0    # store result to t0

    li      $v0, 1
    move    $a0, $t0    # print t0
    syscall 

    li      $v0, 10     # exit
    syscall