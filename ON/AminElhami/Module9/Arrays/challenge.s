.data
result: .asciiz "Sum of the array is: "
X:      .word   3, 2, 1, 8, 6
N:      .word   5
    .text

arr_sum:
    li      $t0, 0              # iterator
    li      $t1, 0              # element
    li      $t2, 0              # initial sum = 0

loop:
    bge     $t0, $a1, final
    lw      $a0, X($t1)         # a0 = X(i)

    add     $t2, $t2, $a0       # sum

    addi    $t1, $t1, 4         # an interger every 4 bytes
    addi    $t0, $t0, 1         
    j       loop

final:
    jr      $ra

main:
    li      $v0, 4
    la      $a0, result         # print message string
    syscall
    
    la      $a0, X              # X to a0
    lw      $a1, N              # element quantity = a1 = 5
    jal     arr_sum             # arr_sum calling 

    move    $a0, $t2
    
    li      $v0, 1
    syscall

    li      $v0, 10
    syscall