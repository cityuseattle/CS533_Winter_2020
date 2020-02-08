        .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "Hello \n"
        .text

main:
        li		$v0, 4		    # print a string
        la		$a0, num		# print num string
        syscall

        li		$v0, 5		    # read input from user
        syscall
        move 	$t1, $v0		# $t1 = $v0 save input in t1

        li		$t0, 0		    # $t0 = 0 for loop iterator i = 0
for_loop:
        bge		$t0, $t1, exit	# if $t0 >= $t1 then exit

        li		$v0, 4		    # print a string
        la		$a0, msg		# print hello string
        syscall
        addi	$t0, 1			# increment t0 by 1

        j		for_loop		# jump to for_loop to check for conditional

exit:
        li		$v0, 10		    # $v0 = 10 end program
        syscall
        
        
        
        
        

        

        
        
        
        