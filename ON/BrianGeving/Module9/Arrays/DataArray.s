.data
list:   .word 3, 4, 5, 6
.text

main:
la $t0, list        #load beginning of array list[0] into t0

lw $t1, 4($t0)      #load list[1]

li $v0, 1
move $a0, $t1       #4
syscall

li $v0, 10
syscall