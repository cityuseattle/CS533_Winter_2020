.data
n1:     .asciiz "\n"
enter:  .asciiz "\nEnter number: "
.text
fact:
beqz $a0, return1           #branch if a0=0

li $v0, 1
li $t0, 1
fact_loop:
bgt $t0, $a0, end_fact_loop #branch if true

mul $v0, $v0, $t0           #v0=v0*t0
addi $t0, $t0, 1            #t0=t0+1
j fact_loop

end_fact_loop:
jr $ra

return1:
li $v0, 1
jr $ra

main:
li $a0, 6
jal fact

move $t0, $v0               #t0=v0 to free v0
li $v0, 1
move $a0, $t0               #a0=t0 to print
syscall

li $v0, 4
la $a0, n1
syscall

li $a0, 7
jal fact
move $t0, $v0
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, enter
syscall
li $v0, 5                   #get input
syscall
move $a0, $v0               #put input in a0
jal fact
move $t0, $v0
li $v0, 1
move $a0, $t0
syscall
li $v0, 10
syscall
