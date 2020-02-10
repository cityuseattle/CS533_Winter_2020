.data
num:        .asciiz "Please enter a number: "
msg:        .asciiz "Hello \n"
.text

main:
li $v0, 4
la $a0, num             #print num msg
syscall

li $v0, 5               #read input
syscall
move $t1, $v0

li $t0, 0
for_loop:
bge $t0, $t1, exit      #exit if true

li $v0, 4
la $a0, msg             #hello string
syscall
addi $t0, 1             #add 1 to count
j for_loop              #repeat loop

exit:
li $v0, 10              #exit
syscall
