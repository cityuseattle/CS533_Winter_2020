        .data
num:    .asciiz "Enter a number: "
r:      .asciiz "! = "
nl:     .asciiz "\n"
        .text

main:
        li		$v0, 4		# $v0 = 4
        la		$a0, num		# 
        syscall

        li		$v0, 5		# $v0 = 5
        syscall
        move 	$t0, $v0		# $t0 = $v0
        
        li		$t1, 1		# $t1 = 1
        li		$t2, 1		# $t2 = 1

for_loop:
        bgt		$t1, $t0, exit	# if $t1 > $t0 then exit
        
        mul     $t2, $t2, $t1
        addi	$t1, $t1, 1			# $t1 = $t1 + 1
        j		for_loop				# jump to for_loop

exit:
        li		$v0, 1		# $v0 = 1
        move 	$a0, $t0		# $a0 = $t0 
        syscall

        li		$v0, 4		# $v0 = 4
        la		$a0, r		# 
        syscall

        li		$v0, 1		# $v0 = 1
        move 	$a0, $t2		# $a0 = $t2 
        syscall
        
        li      $v0, 10
        syscall