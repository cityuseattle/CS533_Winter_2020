        .data
str:    .asciiz "The sum of the array elements is: "
X:      .word 3, 2, 1, 8, 6
N:      .word 5
.text


arr_square:
    li $t0, 0                   #loop pointer
    li $t1, 0                   # offset to acces the memory location
    li $t2, 0
loop:
    bge     $t0, $a1, final     # if t0 >= a1 then go to final
    lw      $a0, X($t1)         # else a0 = X[i]

    add		$t2, $a0, $t2		# t2 = a1 + t2
    
    addi    $t1, $t1, 4         # increase offset by 4 bytes each
    addi    $t0, $t0, 1         # t0 = t0 + 1
    j       loop                # loop back

final: 
    
    la      $a0, str            # load str
    li      $v0, 4              # print string
    syscall 

    li      $v0, 1
    move    $a0, $t2            # a0 = t2
    syscall

    jr      $ra

main:     

    la  $a0, X                  # a0 = load address of array X
    lw  $a1, N                  # a1 = 10 - number of elements
    jal arr_square              

    li  $v0, 10
    syscall