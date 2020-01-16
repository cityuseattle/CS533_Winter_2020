        .data
msg1: .asciiz "Mult result is "     # assign msg1 string
        .text

main:
    li      $t1, 30
    li      $t2, 5

    mult    $t1, $t2        # t1*t2 = Hi and Lo registers
    mflo    $t3             # copy Lo to t3

    li      $v0, 4          # print string
    la      $a0, msg1       # load address of string msg1
    syscall

    li      $v0, 1
    move 	$a0, $t3		# copy the value of t3 into a0
    syscall
    
    li		$v0,  10              
    syscall