.data
arr:    .word 3, 2, 1, 8, 6
.text

main:
la $t1, arr        #load beginning of arr into t1
li $t0, 0           #loop iterator

loop1:
bge $t0, 5, exit    #array size = 5

#load first element increment to next
lw $t2, 0($t1)
addi $t1, $t1, 4

li $v0, 1
move $a0, $t2       #print value
syscall

li $v0, 11          #print character
li $a0, 32          #print space
syscall

addi $t0, $t0, 1    #increment counter
j loop1

exit:
li $v0, 10
syscall