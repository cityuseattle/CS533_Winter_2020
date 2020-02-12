.data
msg: .asciiz "The answer of b^e is: "
msg1: .asciiz "Enter the base: "
msg2: .asciiz "Enter the power: "
.text

power:
    bne $a2, $zero, recursion
    li $v0, 1
    jr $ra
recursion:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    addi $a2, $a2, -1
    jal power
    mul $v0, $a1, $v0
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    
    syscall
    add $a1, $v0, 0
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    
    syscall
    add $a2, $v0, 0
    jal power
    move $t0, $v0
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 10

    syscall