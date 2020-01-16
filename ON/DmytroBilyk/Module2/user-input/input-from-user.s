        .data
prompt: .asciiz "Enter an integer: "    # assign promp string
respon: .asciiz "You entered "          # assign respon string
endl:   .asciiz "\n"
        .text

main:
    li		$v0, 4          # print string
    la      $a0, prompt 	# load address of prompt string
    syscall

    li		$v0, 5 	        # reads an integer
    syscall
    move 	$t0, $v0		# copy the value of t0 into $v0

    li		$v0, 4          # print string
    la      $a0, respon 	# load address of respon string
    syscall

    li      $v0, 1          # print integer
    move    $a0, $t0        # copy the value of t0 into a0
    syscall

    li		$v0, 4          # print string
    la      $a0, endl 	    # load address of endl string
    syscall

    li		$v0,  10        # $v0 = 10          
    syscall