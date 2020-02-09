        .data
num:    .asciiz "Please enter a number: "
Thanku: .asciiz "Thank you"
        .text

main:
        li		$t0, 5		        # $t0 =5    this is the number that we want the user to guess

while:
        beq		$t0, $t1, exitt	    # if condition true t0=t1, jumpto exit. otherwise, it will execute while loop

        li		$v0, 4
        la		$a0, num		    # please enter a number
        syscall

        li		$v0, 5 		
        syscall                     # read input from user
        move 	$t1, $v0		    # $t1 = v0 save the input in t1

        j		while				# jump to while label to check the condition

exitt:                              # end of loop

        li		$v0, 4
        la		$a0, Thanku		    # print thank you
        syscall

        li		$v0, 10 	
        syscall
        
        
        

        
        
        
                
        