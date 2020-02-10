.data
num:        .asciiz "Enter a number: "
msg:        .asciiz "The prime factorization of "
is:         .asciiz "is "
comma:      .asciiz ","
n1:         .asciiz "\n"
.text

main:
li $v0, 4
la $a0, num         #print num
syscall

li $v0, 5           #read input
syscall
move $t0, $v0       #put input num into t0

li $v0, 4
la $a0, msg         #print msg
syscall

li $v0, 1
move $a0, $t0       #print t0
syscall

li $v0, 4
la $a0, is          #print is
syscall

li $t1, 2           #counter starts at 2

while:
bge $t1, $t0, end_while #break when t1>=t0

div $t0, $t1        #mfhi=rem mflo=quotient
mfhi $t2            #t2=rem

bnez $t2, else      #else if t2!=0

li $v0, 1
move $a0, $t1       #print t1
syscall

li $v0, 4
la $a0, comma       #print comma
syscall

mflo $t0            #t0=quotient
j while

else:
addi $t1, 1         #i++
j while

end_while:
li $v0, 1
move $a0, $t0       #print t0
syscall

li $v0, 4
la $a0, n1          #print newline
syscall

li $v0, 10          #exit
syscall