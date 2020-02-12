.data
msg1: .asciiz "The sum of the array elements is: "
X: .word 3, 2, 1, 8, 6
N: .word 5
.text

arr_square:
    li $t0, 0
    li $t1, 0
    li $t3, 0
loop:

bge $t0, $a1, final                             #forloop 
lw $a0, X($t1)                                  # load value in and get total
add $t3, $t3, $a0
addi $t1, $t1, 4
addi $t0, $t0, 1
j loop

final:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 1                                           #print out total
    move $a0, $t3
    syscall
    jr $ra


main:
    la $a0, X
    lw $a1, N
    jal arr_square
    li $v0, 10

    syscall