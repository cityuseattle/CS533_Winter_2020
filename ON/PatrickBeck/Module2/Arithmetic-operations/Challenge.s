        .data
n1:     .asciiz "\n"
        .text

main:
        li      $t1, 30         # $t1=30
        li      $t2, 5          # $t2=5

        add     $a0, $t1, $t2       # $a0= $t1 + $t2
        add     $a0, 7              # $a0 = $a0 + 7
        li      $v0, 1              # print integer
        syscall                     # print the result of addition

        li      $v0, 4
        la      $a0, n1             # print new line
        syscall

        div     $t1, $t2            # $t1/$t2
        mflo    $a0                 # $a0 = $t1/$t2
        li      $v0, 1              # print integer
        syscall                     # print the result of division

        li      $v0, 4
        la      $a0, n1             # print new line
        syscall

        mult    $t1, $t2            # $t1*$t2
        mflo    $a0                 # $a0 = $t1*$t2
        li      $v0, 1              # print integer
        syscall                     # print the result of multiplication

        li      $v0, 4
        la      $a0, n1             # print new line
        syscall

        li      $v0, 10
        syscall

