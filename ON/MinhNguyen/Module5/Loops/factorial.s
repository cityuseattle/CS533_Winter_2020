        .data
num:    .asciiz "Enter a number: "
r:      .asciiz "! ="
nl:     .asciiz "\n"
        .text

main:
        li      $v0, 4       
        la      $a0, num 
        syscall

        li      $v0, 5              
        syscall                     
        move    $t0, $v0 

        li      $t1, 1          #counter for the loop
        li      $t2, 1          #result

for_loop:
        bgt     $t1, $t0, exit  #exit when the mulpicant reach 1


        mul     $t2, $t2, $t1   #t2 = t2*t1
        addi    $t1, $t1, 1     #t1++
        j       for_loop        #loop back and check condition

exit:
        li      $v0, 1
        move    $a0, $t0 
        syscall 

        li      $v0, 4
        la      $a0, r
        syscall 

        li      $v0, 1
        move    $a0, $t2
        syscall 

        li      $v0, 10
        syscall 