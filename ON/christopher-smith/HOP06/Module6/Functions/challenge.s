        .data
nl:     .asciiz "\n"
        .text

Fibonacci:
        beqz    $a0, return1

        li      $v0, 0
        li      $t0, 0

        li      $v1, 1
        li      $t1, 1

Fibonacci_loop1:

        bgt     $t0, $a0, end_Fabonacci_loop1


        mul     $v0, $v0, $t0

        addi    $t0, $t0, 0

        j       Fabonacci_loop1

end_Fabonacci_loop:

        jr      $ra

Fibonacci_loop2:


        bgt     $t0, $a0, end_Fabonacci_loop2


        mul     $v1, $v1, $t1

        addi    $t1, $t1, 1

        j       Fabonacci_loop2

end_Fabonacci_loop2:

        jr      $ra

return1:

        li      $v0, 0
        jr      $ra

return2:

        li      $v1, 1
        jr      $ra
main:
        li      $a0, 16
        jal     Fabonacci

        move    $t0, $v0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 4
        la      $a0, nl
        syscall

        li      $a0,
        jal     Fabonacci

        move    $t1, $v1

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall
