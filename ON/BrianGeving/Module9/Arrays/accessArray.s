.data
array1: .space  20  #20 bytes of storage
.text

main:
la $t0, array1      #load base address of array into t0
li $t1, 3           #t1=3
sw $t1, ($t0)       #first array element

li $t1, 5
sw $t1, 4($t0)      #second array element

li $t1, 6
sw $t1, 8($t0)      #third array element

li $t1, 8
sw $t1, 12($t0)     #fourth array element

li $t1, 10
sw $t1, 16($t0)     #fifth array element

li $v0, 1
lw $a0, 8($t0)      #load third array element array[2]
syscall

li $v0, 10
syscall
