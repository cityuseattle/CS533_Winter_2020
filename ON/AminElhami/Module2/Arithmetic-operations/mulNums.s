.data 
msg: .asciiz "mult result is: "
.text

main:
    li $t1, 30
    li $t2, 5
    mult $t1, $t2
    mflo $t3

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall