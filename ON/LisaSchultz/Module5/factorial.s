            .data
num:        .asciiz "Enter a number: "
r:          .asciiz "! = "
nl:         .asciiz "\n"
            .text

main:
            li		$v0, 4		    # print string
            la		$a0, num		# print num string
            syscall

            li		$v0, 5		    # get user input
            syscall
            move 	$t0, $v0		# $t0 = $v0 copy user input into t0

            li		$t1, 1		    # $t1 = 1 counter of the loop
            li		$t2, 1		    # $t2 = 1 result

for_loop:
            bgt		$t1, $t0, exit	# if $t1 > $t0 then exit

            mul     $t2, $t2, $t1   # t2=t2*t1
            addi	$t1, $t1, 1		# $t1 = $t1 + 1 increment t1
            j		for_loop		# jump to for_loop

exit:
            li		$v0, 1		    # print integer
            move 	$a0, $t0		# $a0 = $t0 copy t0's value to a0 to be printed
            syscall

            li		$v0, 4		    # print string
            la		$a0, r		    # print r string
            syscall

            li		$v0, 1		    # print integer
            move 	$a0, $t2		# $a0 = $t2 copy result to a0 to be printed
            syscall

            li		$v0, 10		    # end program
            syscall
            
            
            
            
            
            
            
           
            
            
            
            
            
            
            
            