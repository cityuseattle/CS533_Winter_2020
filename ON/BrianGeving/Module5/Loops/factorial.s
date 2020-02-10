.data
num:        .asciiz "Enter a number: "
r:          .asciiz "! = "
n1:         .asciiz "\n"
.text

main:
li $v0, 4
la $a0, num         #print num
syscall

li $v0, 5           #read input
syscall
move $t0, $v0       #put input in t0

li $t1, 1           #counter
li $t2, 1           #result

for_loop:
bgt $t1, $t0, exit  #break when t1>t0

mul $t2, $t2, $t1   #t2*t1
addi $t1, $t1, 1    #t1+1
j for_loop

exit:
li $v0, 1
move $a0, $t0       #move and print value in t0
syscall

li $v0, 4
la $a0, r           #print r
syscall

li $v0, 1
move $a0, $t2       #move and print value in t2
syscall

li $v0, 10
syscall

