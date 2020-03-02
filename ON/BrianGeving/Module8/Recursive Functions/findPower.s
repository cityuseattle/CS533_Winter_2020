.data
base:   .asciiz "Enter the base: "
exp:    .asciiz "\nEnter the exponent: "
msg:    .asciiz "\nThe answer of b^e is: "
.text

power:
bne $a1, $zero, recursion           #if not zero jump to recursion
li $v0, 1                           #otherwise return 1
jr $ra

recursion:
addi $sp, $sp, -4                   #allocate space for one int
sw $ra, 0($sp)                      #store
addi $a1, $a1, -1                   #a1--
jal power                           #call power
mul $v0, $a0, $v0                   #multiply result by base
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

main:
li $v0, 4
la $a0, base
syscall
li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, exp
syscall
li $v0, 5
syscall
move $t2, $v0

move $a0, $t1
move $a1, $t2
jal power

move $t0, $v0

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall