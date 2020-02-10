.data
num:        .asciiz "Enter a number: "
Thanku:     .asciiz "Thank you"
.text

main:
li $t0, 5            #t0=5

while:
beq $t0, $t1, exit   #exit if true
li $v0, 4
la $a0, num          #print num
syscall
li $v0, 5            #read input
syscall
move $t1, $v0        #t1=input
j while

exit:
li $v0, 4
la $a0, Thanku       #print thanku
syscall
li $v0, 10
syscall