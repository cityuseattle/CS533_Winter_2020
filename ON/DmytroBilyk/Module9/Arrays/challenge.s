        .data
space:  .asciiz " "
result: .asciiz "The sum of the array elements is: "
X:      .word 3, 2, 1, 8, 6
N:      .word 5
        .text

arr_square:
    li  $t0, 0      # $t0=0 loop iterator
    li  $t1, 0      # $t1=0 offset to access the memory location
    li  $t2, 0      # $t2=0 offset to access the memory location

loop:
        bge     $t0, $a1, final     # if $t0 >= $a1 then goto final
        lw      $a0, X($t1)         # $a0 = X(i)   

        add     $t2, $a0, $t2        # record the updated sum value
        addi    $t1, $t1, 4         # every 4 bytest there is an integer in the array

        # increment counter
        addi    $t0, $t0, 1
        j       loop 

final:
        la      $a0, result         # load a result
        li      $v0, 4              # print string
        syscall

        li      $v0, 1              # display integer sum
        move    $a0, $t2 
        syscall

        jr      $ra

main:
        la      $a0, X              # a0=load address of array X
        lw      $a1, N              # a1=5 number elements
        jal     arr_square          # call arr_square

        li      $v0, 10      # exit program
        syscall
