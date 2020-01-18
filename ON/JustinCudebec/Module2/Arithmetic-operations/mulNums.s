        .data
msg1:   .asciiz "Mult result is "
        .text
main:
        li      $t1, 30
        li      $t2, 5

        mult    $t1, $t2        # $t1 * $t2 = Hi and Lo registers
        mflo    $t3             # copy Lo to $t3


        li      $v0, 4          # print string
        la      $a0, msg1       # load address of string
        syscall

        li      $v0, 1          # print integer
        move    $a0, $t3        # copy the value of t3 into a0
        syscall                 # print the value of a0

        li      $v0, 10
        syscall