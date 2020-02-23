addTwo:
add $t0, $a0, $a1       #store add
move $v0, $t0
jr $ra

doSomething:
addiu $sp, $sp, 12      #allocate space
sw $s0, 0($sp)          #x
sw $s1, 4($sp)          #y
sw $ra, 8($sp)          #ra
move $s0, $a0           #initialize x
move $s1, $a1           #initialize y
jal addTwo              #jump to addTwo(x,y)
addi $v0, $v0, 10       #add is in $v0
lw $ra, 8($sp)          #load registers
lw $s1, 4($sp)
lw $s0, 0($sp)
addiu $sp, $sp, 12      #deallocate space
jal $ra

main:
li $a0, 20              #x=20
li $a1, 10              #y=10
jal doSomething         #doSomething(x,y)
move $t0, $v0           #move result in t0
li $v0, 1
move $a0, $t0           #print result
syscall
li $v0, 10              #exit
syscall
