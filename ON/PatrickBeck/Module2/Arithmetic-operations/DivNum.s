        .data
msg1:   .asciiz "Div result is "
msg2:   .asciiz "\nRem is "
        .text
main:
        li      $t1, 30
        li      $t2, 5

        div     $t1, $t2        # $t1 / $t2
        mflo    $t3             # $t3 = floor($t1 / $t2)
        mfhi    $t4             # $t4 = $t1 mod $t2

        li      $v0, 4          # print string
        la      $a0, msg1       # load address of string
        syscall                 # print string

        li      $v0, 1          # print integer
        move    $a0, $t3        # copy the value of t3 into a0
        syscall                 # print the value of a0

        li      $v0, 4          # print string
        la      $a0, msg2       # load address of string
        syscall                 # print string

        li      $v0, 1          # print integer
        move    $a0, $t4        # copy the value of t4 into a0
        syscall                 # print the value of a0

        li $v0, 10
        syscall