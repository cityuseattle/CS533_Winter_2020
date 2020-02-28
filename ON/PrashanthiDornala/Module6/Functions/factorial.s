        .data
n1:     .asciiz "\n"
msg:    .asciiz "Enter a number: "
        .text

fact:
        beqz    $a0, return1

        li      $v0, 1
        li      $t0, 1
fact_loop:
        bgt     $t0, $a0, end_fact_loop

        mul     $v0, $v0, $t0

        addi    $t0, $t0, 1

        j       fact_loop

end_fact_loop:
        jr      $ra

return1:
        li      $v0, 1
        jr      $ra

main:
        li      $v0, 4
        la      $a0, msg            #Print a string
        syscall

        li      $v0, 5
        syscall                     #Read an number from console
        move    $a0, $v0            #Move value in v0 to a0

        jal     fact

        move    $t0, $v0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 4
        la      $a0, n1
        syscall

        li      $v0, 4
        la      $a0, msg            #Print a string
        syscall

        li      $v0, 5              #Read anumber from console
        syscall
        move    $a0, $v0            #Move value in v0 to a0

        jal     fact

        move    $t0, $v0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall