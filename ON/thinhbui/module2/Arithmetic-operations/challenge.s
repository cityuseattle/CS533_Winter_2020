.data
msg1: .asciiz "sum of numbers: "
msg2: .asciiz "\n div of numbers is: "
msg3: .asciiz "\n mul of numbers is: "
.text
main:
    li $t1, 30;
    li $t2, 5;
    li $v0, 4
    la $a0, msg1
    syscall

    add $a0, $t1,$t2
    add $a0, $a0, 7
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, msg2
    syscall

    div $t1, $t2
    mflo $a0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, msg3
    syscall

    mul $a0, $t1, $t2
    li $v0, 1
    syscall

    li $v0,10
    syscall