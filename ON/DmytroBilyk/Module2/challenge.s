        .data
nl:     .asciiz "\n"
msg1:     .asciiz "sum of numbers: "
msg2:     .asciiz "div of numbers is: "
msg3:     .asciiz "mul of numbers is: "
        .text

main:
    li      $t1, 30         # assign t1 = 30
    li      $t2, 5          # assign t2 = 5

    li      $v0, 4          # print string
    la      $a0, msg1       # load address of string msg1
    syscall

    add     $a0, $t1, $t2   # add t1 and t2
    addi    $a0, 7          # add a0 and 7
    li      $v0, 1          # print integer
    syscall

    li      $v0, 4          # print string
    la      $a0, nl         # load address of string nl
    syscall

    li      $v0, 4          # print string
    la      $a0, msg2       # load address of string msg2
    syscall

    div     $t1, $t2        # Hi remainder, lo= qutient = t1/t2
    mflo    $a0             # $a0 = t1/t2
    li      $v0, 1          # print integer
    syscall

    li      $v0, 4          # print string
    la      $a0, nl         # load address of string nl
    syscall

    li      $v0, 4          # print string
    la      $a0, msg3       # load address of string msg3
    syscall

    mult	$t1, $t2		# $t1 * $21 = Hi and Lo registers

    mflo	$a0	    		# copy to $a0
    li      $v0, 1          # print integer
    syscall

    li		$v0,  10              
    syscall