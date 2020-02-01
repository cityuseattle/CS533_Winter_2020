        .data
num:    .asciiz "Enter a number: "
r:      .asciiz "! = "
n1:     .asciiz "\n"
        .text
    
main:
        li		$v0, 4              # call string
        la		$a0, num            # print num string
        syscall

        li      $v0, 5              # take user input
        syscall
        move 	$t0, $v0		    # store user input in t0

        li      $t1, 1              # counter of the loop
        li      $t2, 1              # result

for_loop:
        bgt		$t1, $t0, exit	    # if 1 > $t1 then jump to exit, otherwise continue to loop

        mul     $t2, $t2, $t1       # t2 = t2 * t1
        addi	$t1, $t1, 1         # t1++
        j		for_loop			# jump to for_loop to check condition

exit:
        li      $v0, 1              # print integer
        move    $a0, $t0            # move t0 to a0 for printing
        syscall

        li      $v0, 4              # call string
        la      $a0, r              # print r string
        syscall

        li      $v0, 1              # print integer
        move    $a0, $t2            # move t2 to a0 for printing
        syscall

        li      $v0, 10             # end
        syscall
        