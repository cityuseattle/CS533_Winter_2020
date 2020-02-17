.data
ans:    .asciiz "Your answer= "
.text

needTemps:
add $t0, $a0, $a1       #t0=a0+a1
sub $t1, $a0, $a1       #t1=a0-a1
mult $t0, $t1           #t0*t1 = mflo
mflo $t2                #t2 = mflo
move $v0, $t2           #v0=t2
jr $ra

main:
li $a0, 10              #a0=10
li $a1, 8               #a1=8
jal needTemps

move $t0, $v0           #t0=v0

li $v0, 4
la $a0, ans
syscall
li $v0, 1
move $a0, $t0           #a0=t0
syscall
li $v0, 10
syscall