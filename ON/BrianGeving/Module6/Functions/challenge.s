.data
ans:    .asciiz "your answer is: "
.text

fib:
li $a1, 0           #a
li $a2, 1           #b
li $t9, 1           #arbitrary 1 
li $t0, 0           #i(count)
li $t2, 2           #arbitrary 2, because subi doesn't seem to work
sub $t1, $a0, $t2   #n-2
beqz $a0, ret0      #branch here if number is 0
beq $a0, $t9, ret1  #branch here if number is 1


fib_loop:           #enter loop if not 1 or 0
bgt $t0, $t1, ret   #branch if i>n-2
add $a3, $a1, $a2   #c=a+b
move $a1, $a2       #a=b
move $a2, $a3       #b=c
addi $t0, 1         #i++
j fib_loop          #loop

ret0:
li $t8, 0           #t8 temporary answer register
jr $ra              #back to main

ret1:               #same as ret0 but return 1
li $t8, 1
jr $ra

ret:                #return c (a3)
move $t8, $a3
jr $ra              #back to main

main:
li $a0, 16
jal fib
li $v0, 4
la $a0, ans         #print text
syscall
li $v0, 1
move $a0, $t8       #take answer from t8 put and print
syscall
li $v0, 10
syscall
