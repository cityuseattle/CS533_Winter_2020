.data
divmsg: .asciiz "Div is: "
remmsg: .asciiz "\nRemainder is: "
.text

main:
    li $t1, 30
    li $t2, 5

    div $t1, $t2
    mflo $t3
    mfhi $t4

    li $v0, 4
    la $a0, divmsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, remmsg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall

    