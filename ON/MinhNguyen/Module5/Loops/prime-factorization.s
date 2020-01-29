        .data
num:    .asciiz "Enter a number: "
msg:    .asciiz "The prime factorization of "
is:     .asciiz " is "
comma:  .asciiz ","
nl:     .asciiz "\n"
        .text

main:
        li      $v0, 4       
        la      $a0, num 
        syscall

        li      $v0, 5              
        syscall                     
        move    $t0, $v0            # read input and copy to t0

        li      $v0, 4
        la      $a0, msg            # print message
        syscall 

        li      $v0, 1
        move    $a0, $t0            # print the entered number in between string
        syscall 

        li      $v0, 4
        la      $a0, is             # is
        syscall 

        li      $t1, 2              # counter starts from 2

while:
        bge     $t1, $t0, end_while 

        div     $t0, $t1            # mfhi = rem = t0%t1, mflo = quotinent = t0/t1
        mfhi    $t2                 # t2 = remainder of t0/t1

        bnez    $t2, else           # check the condition t2!=0, jump to else if true

        li      $v0, 1
        move    $a0, $t1            # print t1
        syscall 

        li      $v0, 4
        la      $a0, comma          # print comma
        syscall 

        mflo    $t0                 # update the value of t0, t0 = t0/t1, same as n = n/i
        
        j       while               # jump to while to check the condition

else:
        addi    $t1, 1              # i++, switch to new number 

        j       while               # jump back to while

end_while:
        li      $v0, 1              # print t0
        move    $a0, $t0        
        syscall 

        li      $v0, 4
        la      $a0, nl
        syscall 

        li      $v0, 10
        syscall 