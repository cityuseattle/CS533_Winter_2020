            .data
Thanku:     .asciiz "\nThank You"
            .text
main:
        li		$t0, 2		# $t0 =2
        li		$t1, 5		# $t1 =5 

        ble		$t0, $t1, else_statm	# condition is true, so will jump to else_statm

        sub		$a0, $t0, $t1		# will
        li      $v0, 1              # skip this part
        syscall
        j		end_if			

else_statm:
        addi	$a0, $t0, 20			# $a0 = $t0 + 20
        li      $v0, 1                  #print integer
        syscall

end_if:                                 # jump here to continue the code
        li      $v0, 4                  # system call code to print string
        la		$a0, Thanku
        syscall

        li      $v0, 10                 # end of program
        syscall
        
        
         