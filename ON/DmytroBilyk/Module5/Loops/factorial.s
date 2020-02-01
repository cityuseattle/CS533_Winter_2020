        .data
num:    .asciiz "Please enter a number: "
r:    .asciiz "! = "
nl:    .asciiz "\n"
        .text

main:
        li      $v0, 4          # print a string
        la		$a0, num		# to print num string enter a message
        syscall

        li      $v0, 5          # read input from user
        syscall
        move    $t0, $v0        # save the input in t0

        li      $t1, 1          # counter of the loop
        li      $t2, 1          # result

for_loop:
    bgt         $t1, $t0, exit  # if continue true, jump to exit
                                # if the condition false(i<n), continue executing the for loop

    mul         $t2, $t2, $t1   # t2=t2 * t1
    addi        $t1, $t1, 1
    j           for_loop        # jump to for_loop label to check the condition

exit:
    li          $v0, 1
    move        $a0, $t0
    syscall

    li          $v0, 4
    la          $a0, r          # copy r address to a0 to access and print the string
    syscall

    li          $v0, 1
    move        $a0, $t2
    syscall

    li          $v0, 10
    syscall