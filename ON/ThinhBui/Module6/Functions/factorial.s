.data

nl: .asciiz "\n"
msg1: .asciiz "Type in number: "
.text

fact:
beqz $a0, return1

li $v0, 1

li $t0, 1

fact_loop:

bgt $t0, $a0, end_fact_loop
mul $v0, $v0, $t0
addi $t0, $t0, 1
j fact_loop
end_fact_loop:
    jr		$ra					# jump to $ra
return1:
li $v0, 1
jr  $ra
main:
li $v0, 4
la $a0, msg1
syscall
li $v0, 5
syscall
add $a0, $v0, $zero
jal fact
move $t0, $v0
li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, nl
syscall

li $v0, 4
la $a0, msg1
syscall
li $v0, 5
syscall
add $a0, $v0, $zero
jal fact
move $t0, $v0
li $v0, 1

move $a0, $t0
syscall

li $v0, 10

syscall