        .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "Hello \n"
        .text

main:
        li      $v0, 4          # print string
        la      $a0, num        # load label num
        syscall

        li      $v0, 5          # read input from user
        syscall
        move    $t1, $v0        # store input to t1

        li      $t0, 0          # for loop 

for_loop:
        bge     $t0, $t1, exit  # the for loop will continue if this condition met

        li      $v0, 4
        la      $a0, msg 
        syscall 
        addi    $t0, 1

        j       for_loop        #jump back to the for_loop to check the condition 

exit:
        li,     $v0, 10
        syscall