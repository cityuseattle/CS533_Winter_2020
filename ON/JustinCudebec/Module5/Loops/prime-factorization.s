        .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "The prime factorization of "
is:     .asciiz "is "
comma:  .asciiz ","
nl:     .asciiz "\n"
        .text

main:
        li      $v0, 4              # print string
        la      $a0, num            # address of "please enter number" sting
        syscall

        li      $v0, 5              # Read integer from user
        syscall
        move    $t0, $v0            # copy the value of user input into t0, t0=v0

        li      $v0, 4              # print string
        la      $a0, msg            # address of "the prime factorization of" string
        syscall

        li      $v0, 1              # print integer
        move    $a0, $t0            # print the number that the user entered
        syscall

        li      $v0, 4
        la      $a0, is
        syscall

        li      $t1, 2              # counter starts from 2, same as i=2 in c++

while:
        bge     $t1, $t0, end_while # check the condition, if true, jump to the end.otherwise, continue the loop

        div     $t0, $t1            # mfhi = rem=t0%t1, mflo=quotient=t0/t1
        mfhi    $t2                 # t2= t0%t1

        bnez    $t2, else           # check the condition t2!=0, if true, it jumps to else, otherwise continue the code

        li      $v0, 1              # Read integer
        move    $a0, $t1            # print the iterator t1
        syscall

        li      $v0, 4              # print comma
        la      $a0, comma
        syscall

        mflo    $t0                 # update the value of t0, t0=t0/t1, same as n=n/i

        j       while               # jump to while to check the condition

else:
        addi    $t1, 1              # i++

        j       while               # jump to while to check the condtion

end_while:
        li      $v0, 1              # print integer
        move    $a0, $t0            # same as printing 'n' at the end of the c++ code
        syscall

        li      $v0, 4
        la      $a0, nl
        syscall

        li      $v0, 10
        syscall