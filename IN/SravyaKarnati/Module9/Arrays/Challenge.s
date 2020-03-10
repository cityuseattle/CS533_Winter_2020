.data
arr: .word 3, 2, 1, 8, 6
msg:  .asciiz "The sum of the array elements is: "
.text

main:
    addi $t0, $0, 0 # clear i
    addi $t1, $0, 0 # clear sum
    ori $t2, $0, 5 # Initializing t2 to its constant value 10
    la $t3, arr # load address of array into t4
loop:
    slt $t4, $t0, $t2 # compare, $t4 = i < sum ? 1 : 0
    beq $t4, $0, end # if i is not < 10, exit the loop
    lw $t4, 0($t3) # load current array element into t4
    add $t1, $t1, $t4 # add it to sum
    add $t0, $t0, 1 # increment 
    add $t3, $t3, 4 # increment current array element pointer
j loop
end:
    addi $v0, $0, 4 # Now we print out result: string
    la $a0, msg
    syscall
    addi $v0, $0, 1 # followed by the actual sum (which is in t1)
    add $a0, $t1, $0
    syscall
jr $ra
.end main