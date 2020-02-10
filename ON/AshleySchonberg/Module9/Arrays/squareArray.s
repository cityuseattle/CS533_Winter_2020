        .data
space:  .asciiz " "
X:      .word 3, 2, 1, 8, 6
N:      .word 5
        .text

arr_square:
    li		$t0, 0      # t0 = 0, loop iterator
    li      $t1, 0      # t1 = 0, offset to access the memory location

loop:
    bge		$t0, $a1, final     # if t0 >= a1 then goto final
    lw		$a0, X($t1)         # a0 = X(i)

    mul     $a0, $a0, $a0
    li      $v0, 1              # print integer
    syscall

    la		$a0, space          # load a space
    li      $v0, 4              # print space string
    syscall

    addi    $t1, $t1, 4         # every 4 bytes there is an integer in the array
    addi    $t0, $t0, 1         # t0 = t0 + 1
    j       loop

final:
    jr      $ra

main:
    la      $a0, X              # a0 = load address of array X
    lw      $a1, N              # a1 = 10, number of elements
    jal     arr_square          # call arr_square

    li      $v0, 10         
    syscall