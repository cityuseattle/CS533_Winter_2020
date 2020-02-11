addtwo:
add $t0, $a0, $a1               #int add = a+b;
move $v0, $t0                   #return add;
jr $ra

dosomething:
addiu $sp, $sp, -16                 #push stack
sw $s0, 0($sp)                      #store value
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $ra, 12($sp)
move $s0, $a0
move $s1, $a1

jal addtwo                      #int a = addTwo(x,y)
move $s2, $v0
move $a0, $s1
move $a1, $s0

add $v0, 10                     #return a+10;
lw $ra, 12($sp)                #load value out
lw $s2, 8($sp)
lw $s0, 0($sp)
lw $s1, 4($sp)
addiu $sp, $sp, 16               #pop stack
jal $ra

main:
li $a0, 20
li $a1, 10
jal dosomething
move $t0, $v0       #save the returning value of the function into t0
li $v0, 1

move $a0, $t0
syscall
 li $v0, 10

 syscall