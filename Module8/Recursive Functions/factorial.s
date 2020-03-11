            .data
prompt:     .asciiz "Input an integer x:\n"
result:     .asciiz "Fact(x) = "
            .text

factorial:
    addi    $sp, $sp -8
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    bne     $a0, 0, else
    addi    $v0, $zero, 1
    j       fact_return

else:
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
    li      $v0, 4
    la      $a0, prompt
    syscall

    li      $v0, 5
    syscall

    move    $a0, $v0
    jal     factorial
    move    $t0, $v0

    li      $v0, 4
    la      $a0, result
    syscall

    li      $v0, 1
    move    $a0, $t0
    syscall

    li      $v0, 10
    syscall