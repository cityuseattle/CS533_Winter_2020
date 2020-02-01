        .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "Hello \n"
        .text

main:
        li		$v0, 4          # print string system call
        la      $a0, num        # print num string
        syscall

        li      $v0, 5          # read input from user
        syscall
        move    $t1, $v0        # save input to t1

        li      $t0, 0          # for loop iterator

for_loop:
        bge		$t0, $t1, exit	# if $t0 >= $t1 then jump to exit, otherwise, continue to loop

        li      $v0, 4          # print string system call
        la      $a0, msg        # print msg string
        syscall
        addi	$t0, 1          # increment iteator (i++)

        j       for_loop        # jump to for_loop to check condition

exit:
        li      $v0, 10         # exit
        syscall
        
        
        
