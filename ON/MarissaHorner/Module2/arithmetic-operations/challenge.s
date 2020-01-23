        .data
msg1:   .asciiz "sum of numbers: "
msg2:   .asciiz "\ndiv of numbers: "
msg3:   .asciiz "\nmul of numbers: "
        .text
main:
        li		$t0, 30             # $t0 = 30
        li		$t1, 5              # $t1 = 5

        add		$t2, $t0, $t1		# $t2 = $t0 + $t1 (30+5)
        li		$v0, 1       		# print integer
        syscall
   
        addi	$a0, $t2, 7			# $a0= $t2 + 7  (35+7)
        li		$v0, 1 		        # print integer
        syscall                     # print the result of the addition

        li		$v0, 4              # print string
        la		$a0, msg1         	# print message 1
        syscall                     # print string

        li		$v0, 1   		# print integer
        move 	$a0, $t2		# copy the value of t3 into a0
        syscall                 # print the value of a0


        div     $t0, $t1        # $t0 / $t1
        mflo    $t3             # $t3 = floor($t1 / $t2)
        mfhi    $t4             # $t4 = $t1 mod $t2

        li		$v0, 4   		# print string
        la		$a0, msg2		# load address of string
        syscall                 # print string

        li		$v0, 1   		# print integer
        move 	$a0, $t3		# copy the value of t3 into a0
        syscall                 # print the value of a0

        
        mult	$t0, $t1	        # $t0 * $t1 = Hi and Lo registers	
        mflo	$t5                # copy Lo to $t5	
        
        li		$v0, 1              # print integer
        syscall

        li		$v0, 4              # print string
        la		$a0, msg3           # load address of string
        syscall                     # print string   

        li		$v0, 1   		# print integer
        move 	$a0, $t5		# copy the value of t3 into a0
        syscall                 # print the value of a0 

        li		$v0, 10
        syscall

        
