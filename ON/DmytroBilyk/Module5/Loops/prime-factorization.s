          .data
num:      .asciiz "Please enter a number: "
msg:      .asciiz "The prime factorization of "
is:       .asciiz "is "
comma:    .asciiz ","
nl:       .asciiz "\n"
          .text

main:
        li      $v0, 4          # print a string
        la		$a0, num		# to print num string enter a message
        syscall

        li      $v0, 5          # read input from user
        syscall
        move    $t0, $v0        # save the input in t0

        li      $v0, 4          # print a string
        la		$a0, msg		# to print msg string enter a message
        syscall

        li      $v0, 1          # print integer
        move    $a0, $t0        # print the number that the user entered
        syscall

        li      $v0, 4
        la      $a0, is
        syscall

        li      $t1, 2          # counter starts from 2, same as i=2 in c++

while:
    bge         $t1, $t0, end_while     # if continue true, jump to end.  otherwise continue the loop
                                        
    div         $t0, $t1        # mfhi = remt0%t1, mflo=quotient=t0/t1
    mfhi        $t2             # t2 = t0%t1

    bnez        $t2, else       # check the condition t2!=0, if true, it jumps to else.  Otherwise continue the code

    li          $v0, 1
    move        $a0, $t1
    syscall
    
    li          $v0, 4
    la          $a0, comma
    syscall

    mflo        $t0                     # update the value of t0, t0=t0/t1, same as n=n/i

    j           while                   # jump to while label to check the condition

else: 
    addi        $t1, 1                  # i++

    j           while

end_while:
    li          $v0, 1
    move        $a0, $t0
    syscall

    li          $v0, 4
    la          $a0, nl          # copy r address to a0 to access and print the string
    syscall

    li          $v0, 10
    syscall