        .data
num:    .asciiz "Please enter a number: "
Thanku: .asciiz "Thank you"
        .text

main:
        li		$t0, 5		        # $t0 = 5 number we want the user to guess

while:
        beq		$t0, $t1, exitt	    # if $t0 == $t1 then exitt
        
        li		$v0, 4		        # print string
        la		$a0, num		    # print num string
        syscall

        li		$v0, 5		        # get user input
        syscall
        move 	$t1, $v0		    # $t1 = $v0 save input in t1

        j		while				# jump to while

exitt:                              #end of loop

        li		$v0, 4		        # print string
        la		$a0, Thanku		    # print Thanku string
        syscall

        li		$v0, 10		        # end program
        syscall
        
        
        

        
        
        
        
        