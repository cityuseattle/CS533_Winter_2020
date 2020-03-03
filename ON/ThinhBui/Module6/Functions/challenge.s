.data
msg1: .asciiz "Your answer is: "
.text

main:
li $a1, 0
li $a2, 1
li $a3, 16
li $t1, 0
beq $a3, $a1, case0
beq $a3, $a2, case1
case2:
    forloop:
        add $t1, 1
        add $t2, $a1, $a2
        add $a1, $a2, $zero
        add $a2, $t2, $zero
        blt $t1, $a3, forloop
        
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    move $a0, $a1
    syscall
    j end
case0:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    li $a0, 0
    syscall
    j end
case1:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    li $a0, 1
    syscall
    j end 

end:
li $v0, 10
syscall
