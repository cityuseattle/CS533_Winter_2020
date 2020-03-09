.data
space:  .asciiz " "
X:  .word 3, 2, 1, 8, 6
N:  .word 5
.text

arr_square:
li $t0, 0           #loop iterator
li $t1, 0           #offset

loop:
bge $t0, $a1, final #if iterator >= a1 go to final
lw $a0, X($t1)      #a0 = x(i)

mul $a0, $a0, $a0
li $v0, 1
syscall

la $a0, space
li $v0, 4           #print space
syscall

addi $t1, $t1, 4    #next address
addi $t0, $t0, 1    #iterator++
j loop

final:
jr $ra

main:
la $a0, X           #load first memory address of x into a0
lw $a1, N           #a1=number of elements
jal arr_square     #call arr_square

li $v0, 10          #exit
syscall

