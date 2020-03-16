        .data
result: .asciiz "Array Sum is: "
X:      .word   3, 2, 1, 8, 6
N:      .word   5
        .text

arr_sum:
    li      $t0, 0              # iterator
    li      $t1, 0              # array elems
    li      $t2, 0              # sum = 0

loop:
    bge     $t0, $a1, final
    lw      $a0, X($t1)         # a0 = X(i)

    add     $t2, $t2, $a0       # sum 

    addi    $t1, $t1, 4         # move to next elem 4 bites away
    addi    $t0, $t0, 1         # iterator

    j       loop

final:
    jr      $ra

main:
    li      $v0, 4
    la      $a0, result         
    syscall
    
    la      $a0, X              # X load to a0
    lw      $a1, N              # nums of elem: a1 = 5
    jal     arr_sum            

    move    $a0, $t2
    
    li      $v0, 1
    syscall

    li      $v0, 10
    syscall