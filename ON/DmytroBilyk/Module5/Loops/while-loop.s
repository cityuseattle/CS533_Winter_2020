        .data
num:    .asciiz "Please enter a number: "
thanku:    .asciiz "Thank you"
        .text

main:
        li      $t0, 5          # t0=5 this is the number that we want the user to guess

while:
        beq     $t0, $t1, exit        # if condition true t0=t1, jump to exit.  Otherwise, it will execute while loop
        
        li      $v0, 4          # print a string
        la		$a0, num		# to print num string enter a message
        syscall

        li      $v0, 5          # read input from user
        syscall
        move    $t1, $v0        # save the input in t1

        j       while           # jump to while label to check the condition

exit:
    li          $v0, 4
    la          $a0, thanku
    syscall

    li          $v0, 10
    syscall