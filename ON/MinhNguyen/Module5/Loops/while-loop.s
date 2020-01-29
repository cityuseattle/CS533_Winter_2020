        .data
num:    .asciiz "Please enter a number: "
Thanku: .asciiz "Thank you"
        .text

main: 
        li      $t0, 5              # number for guessing game

while:
        beq     $t0, $t1, exit      # loop continue WHILE this condition is false

        li      $v0, 4              # guessing game start, enter number:
        la      $a0, num 
        syscall

        li      $v0, 5              
        syscall                     
        move    $t1, $v0            # read input and store to t1

        j       while               # jump back to while loop

exit:

        li      $v0, 4
        la      $a0, Thanku
        syscall 

        li      $v0, 10
        syscall 
        