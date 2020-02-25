    .data
result: .asciiz "The sum of the array elements is: "
X:      .word   3, 2, 1, 8, 6
N:      .word   5
    .text

arr_sum:
    li      $t0, 0              # iterator
    li      $t1, 0              # element in the array
    li      $t2, 0              # t2 is initial sum == 0

loop:
    bge     $t0, $a1, final
    lw      $a0, X($t1)         # a0 = X(i)

    add     $t2, $t2, $a0       # sum each element

    addi    $t1, $t1, 4         # every 4 bytes there is an interger in the array
    addi    $t0, $t0, 1         # t0 = t0 + 1, iterator
    j       loop

final:
    jr      $ra

main:
    li      $v0, 4
    la      $a0, result         # print string
    syscall
    
    la      $a0, X              # load addr of array X to a0
    lw      $a1, N              # number of element, a1 = 5
    jal     arr_sum             # call arr_sum

    move    $a0, $t2
    
    li      $v0, 1
    syscall

    li      $v0, 10
    syscall