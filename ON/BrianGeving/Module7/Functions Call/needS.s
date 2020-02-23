subTwo:
sub $t0, $a0, $a1 #sub to t0
move $v0, $t0
jr $ra

doSomething:
#addiu $sp, $sp, -12  #allocate space for $ra, x, and y
#sw $ra, 8($sp)      #ra
#sw $a0, 4($sp)      #x
#sw $a1, 0($sp)      #y
addiu $sp, $sp, -16
sw $s0, 0($sp)      #x
sw $s1, 4($sp)      #y  
sw $s2, 8($sp)      #a
sw $ra, 12($sp)
move $s0, $a0       #initialize x
move $s1, $a1       #initialize y
jal subTwo          #call subTwo
#lw $a0, 0($sp)      #load y (y,x)
#lw $a1, 4($sp)      #load x
#addiu $sp, $sp, -4  #allocate space for v
#sw $v0, 0($sp)      #store v
move $s2, $v0       #result into s2
move $a0, $s1
move $a1, $s0
jal subTwo          #call subtwo(y,x)
add $v0, $v0, $s2   #a+b

#jal subTwo
#lw $t0, 0($sp)      #load a
#add $v0, $v0, $t0   #a+b
#lw $ra, 12($sp)     #load ra
#addiu $sp, $sp, 16  #deallocate space
lw $ra, 12($sp)     #restore registers
lw $s2, 8($sp)
lw $s1, 4($sp)
lw $s0, 0($sp)
addiu $sp, $sp, 16  #deallocate space
jal $ra

main:
li $a0, 20
li $a1, 10
jal doSomething
move $t0, $v0       #move return value to t0
li $v0, 1
move $a0, $t0       #grab return value and print
syscall
li $v0, 10          #exit
syscall