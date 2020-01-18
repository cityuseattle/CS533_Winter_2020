        .data
msg1:   .asciiz "Mult result is "
        .text

main:
        li		$t1, 30
        li      $t2, 5

        mult    $t1, $t2        # Copy the result to Hi and Lo register
        mflo    $t3             # Copy Lo to $t3

        li      $v0, 4          # print string
        la      $a0, msg1       # load address to string
        syscall

        li      $v0, 1
        move    $a0, $t3
        syscall

        li      $v0, 10
        syscall
        