        .data
num:    .asciiz "Enter a number: "
r:      .asciiz "! = "
nl:     .asciiz "\n"
        .text
main:
        li      $v0, 4              # print string
        la      $a0, num            # string "Enter a number"
        syscall

        li      $v0, 5              # Read integer from user
        syscall
        move    $t0, $v0            # copy the input-user value to t0

        li      $t1, 1              # counter of the loop
        li      $t2, 1              # result

for_loop:
        bgt     $t1, $t0, exit      # if condition true, jump to exit
                                    # if condition false(i<n), continue executing the for loop

        mul     $t2, $t2, $t1       # t2=t2 * t1
        addi    $t1, $t1, 1         # t1++
        j       for_loop            # jump to for_loop to check the condition

exit:                               # after the for loop
        li      $v0, 1              # print integer
        move    $a0, $t0            # copy t0's value into a0 to be printed
        syscall
        
        li      $v0, 4              # print string
        la      $a0, r              # copy 'r' address to a0 to access and print the string
        syscall

        li      $v0, 1              # print integer
        move    $a0, $t2            # copy the result into a0 to be printed
        syscall

        li      $v0, 10
        syscall