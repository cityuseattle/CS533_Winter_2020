.data
X:  .word 3, 2, 1, 8, 6
N:  .word 5
.text

arr_sum:
li $t0, 0       #iterator
li $t1, 0       #offset
addi $t2, $a1, -1   #n-1
lw $a0, X($t1)  #load first element into a0
move $s0, $a0   #move a0 to s0

loop:
bge $t0, $t2, print #if iterator = n-1 jump to print
addi $t1, $t1, 4    #next element in t1
lw $s1, X($t1)      #x[i]
add $s0, $s0, $s1   #sum = sum + x[i]
addi $t0, $t0, 1    #t0++
j loop              #jump to loop

print:
li $v0, 1
move $a0, $s0       #print sum
syscall
jr $ra              #return address in main



main:
la $a0, X       #load start of X in a0
lw $a1, N       #load length into a1
jal arr_sum
li $v0, 10      #exit
syscall

