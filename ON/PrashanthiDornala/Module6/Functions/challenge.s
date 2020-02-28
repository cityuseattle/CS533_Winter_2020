
        .data
n1:     .asciiz "\n"
msg:    .asciiz "The answer is: "
        .text

fib:
        beqz    $a0, return1

        li      $t1, 1
        bgt     $t1, $a0, return2

        li      $t2, 1
        li      $v0, 0
        li      $t0, 0
        li      $t4, 0

fib_loop:
        move    $t3, $a0
        sub     $t3, $t3, 2

        bgt     $t0, $t3, end_fib_loop

        add    $v0,$t4,$t2
        move    $t4, $t2
        move    $t2, $v0

        addi    $t0, $t0, 1

        j       fib_loop

end_fib_loop:
        jr      $ra

return1:
        li      $v0, 0
        jr      $ra

return2:
        li      $v0, 1
        jr      $ra

main:
        li      $a0, 16
        jal     fib

        move    $t0, $v0

        li      $v0, 4
        la      $a0, n1
        syscall

        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall