                .data
Thanku:         .asciiz "\nThank You"
                .text
main:
                li      $t0, 5
                li      $t1, 2

                bgt		$t0, $t1, else_statm       	# condition is false because t0>t1, it will continue the code

                sub		$a0, $t0, $t1		        # $a0 = $t0 - $t1
                li	    $v0, 1                      # print integer
                syscall
                j		end_if				        # jump to end_if to skip the "else_statm" part

else_statm:                                         # Skip
                addi	$a0, $t0, 20			    # This
                li      $v0, 1                      # Part
                syscall

end_if:                                             # jump here to continue the code
                li      $v0, 4                      # system call code to print string
                la		$a0, Thanku
                syscall

                li      $v0, 10                     # end of program
                syscall
