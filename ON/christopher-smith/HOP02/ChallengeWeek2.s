        .data
n1:     .asciiz "\n"
        .text

main:
        li      $t1, 30         
        li      $t2, 5

        add    $a0, $t1, $t2
        li      $v0, 1
        syscall

        addi    $a0, $t1, $t2, 7
        li      $v0, 1
        syscall

        li      $v0, 4
        la      $a0, nl
        syscall

        div     $t1, $t2
        mflo    $a0
        li      $v0, 1
        syscall

        li      $v0, 4
        la      $a0, nl
        syscall

        mfhi    $a0
        li      $v0, 1
        syscall

        li      $v0, 1
        la      $a0, nl
        syscall

        mult    $t1, $t2
        mflo    $a0
        li      $v0, 1
        syscall

        li      $v0, 1
        la      $a0, nl
        syscall          

