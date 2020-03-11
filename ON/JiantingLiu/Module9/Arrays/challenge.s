        .data
sum:    .asciiz "The sum of the array elements is:  "
X:      .word   3, 2, 1, 8, 6
N:      .word   5
        .text

arr_square:
    li  $t0, 0
    li  $t1, 0
    li  $t2, 0

    la  $a0, sum
    li  $v0, 4
    syscall

loop:
    bge $t0, $a1, final
    lw  $a0, X($t1)

    addi $a0, $a0, $a0

    addi    $t1, $t1, 4
    addi    $t0, $t0, 1
    j       loop

final:

    li  $v0,1
    syscall
    
    jr  $ra

main:
    la  $a0, X
    lw  $a1, N
    jal arr_square

    li  $v0, 10
    syscall