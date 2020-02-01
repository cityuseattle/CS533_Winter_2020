        .data
num:    .asciiz "Please enter a number: "
Thanku: .asciiz "Thank you"
        .text

main:
        li		$t0, 5              # t0 = 5 (we want user to guess this)

while:
        beq		$t0, $t1, exit	    # if $t0 == $t1 then jump to exit, otherwise continue to loop

        li      $v0, 4              # call string
        la		$a0, num		    # print num string
        syscall

        li      $v0, 5              # take user input
        syscall
        move 	$t1, $v0		    # store user input in t1

        j		while				# jump to while, check condition

exit:
        li      $v0, 4              # call string
        la      $a0, Thanku         # print Thanku string
        syscall

        li      $v0, 10             # exit
        syscall
        
        
        