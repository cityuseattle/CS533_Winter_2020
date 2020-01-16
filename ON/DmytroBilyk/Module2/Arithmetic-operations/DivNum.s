        .data
msg1: .asciiz "Div result is: "    # assign msg1 string
msg2: .asciiz "\nRen is: "          # assign msg2 string
        .text

main:
    li      $t1, 30
    li      $t2, 5

    div     $t1, $t2        # t1/t2
    mflo    $t3             # t3 = floor(t1/t2)
    mfhi    $t4             # t4 = t1 mod t2

    li      $v0, 4          # print string
    la      $a0, msg1       # load address of string msg1
    syscall

    li      $v0, 1
    move 	$a0, $t3		# copy the value of t3 into a0
    syscall

    li		$v0, 4          # print string
    la      $a0, msg2    	# load address of msg2 string
    syscall

    li      $v0, 1          # print integer
    move 	$a0, $t4		# copy the value of t4 into a0
    syscall
    
    li		$v0,  10              
    syscall