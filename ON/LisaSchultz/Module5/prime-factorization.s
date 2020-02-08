            .data
num:        .asciiz "Please enter a number: "
msg:        .asciiz "The prime factorization of "
is:         .asciiz "is "
comma:      .asciiz ","
nl:         .asciiz "\n"
            .text

main:
            li		$v0, 4		    # print string
            la		$a0, num		# print num string
            syscall

            li		$v0, 5		    # get user input
            syscall
            move 	$t0, $v0		# $t0 = $vo copy user input into t0

            li		$v0, 4		    # print string
            la		$a0, msg		# print msg string
            syscall

            li		$v0, 1		    # print integer
            move 	$a0, $t0		# $a0 = $t0 copy t0 to a0 to be printed
            syscall

            li		$v0, 4		    # $v0 = 4 print string
            la		$a0, is		    # print is
            syscall

            li		$t1, 2		    # $t1 = 2 counter starts from 2

while:
            bge		$t1, $t0, end_while	# if $t1 >= $t0 then end_while
            
            div		$t0, $t1			# $t0 / $t1 mfhi = rem=t0%t1, mflo=quotient=t0/t1 
            mfhi	$t2					# $t2 = $t0 mod $t1 

            bnez    $t2, else           # check the condtion t2!=0, if true, it jumps to else, otherwise continue

            li		$v0, 1		        # print integer
            move 	$a0, $t1		    # $a0 = $t1 print t1 interator
            syscall

            li		$v0, 4		        # print string
            la		$a0, comma		    # print comma
            syscall

            mflo    $t0                 # update the value of t0, t0=t0/t1

            j		while				# jump to while
            
else:
            addi	$t1, 1 			    # increment t1

            j		while				# jump to while
            
end_while:
            li		$v0, 1		        # print integer
            move 	$a0, $t0		    # $a0 = $t0, copy to to a0 to print
            syscall

            li		$v0, 4		        # print string
            la		$a0, nl		        # print new line
            syscall

            li		$v0, 10		        # end program
            syscall
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            