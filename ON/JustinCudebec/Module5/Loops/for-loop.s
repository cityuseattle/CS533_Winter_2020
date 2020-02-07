        .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "Hello \n"
        .text
main:
        li      $v0, 4                  # print a string
        la      $a0, num                # to print num string " enter a number"
        syscall

        li      $v0, 5                  # read input from user
        syscall
        move    $t1, $v0                # save the input in t1

        li      $t0,0                   # for loop iterator i=0 in c++, $t0=0
for_loop:
        bge     $t0, $t1, exit          # it will execute the loop if the condition is false
                                        # if the condition true (i>n) it will jump to exit
                                    
        li      $v0, 4                  # print a string
        la      $a0, msg                # hello string
        syscall
        addi    $t0,1                   # increment the iteator by 1, i++ in c++

        j       for_loop                # jump to for_loop label to check the condition

exit:
        li      $v0, 10
        syscall