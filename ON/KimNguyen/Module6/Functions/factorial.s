        .data
nl:     .asciiz "\n"
msg:    .asciiz "Enter an integer: "
        .text

fact:   
        beqz    $a0, return1  #if a0==0, jum to return1 label
        li      $v0, 1
        li      $t0, 1 #loop iterator

fact_loop:
        bgt     $t0, $a0, end_fact_loop 

        mul     $v0, $v0, $t0

        addi    $t0, $t0, 1

        j       fact_loop

end_fact_loop: 
        jr      $ra

return1:
        li      $v0, 1
        jr      $ra

main:       
        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 5 #HOP challenge 
        syscall
        move    $a0, $v0
        
        #li      $a0, 6 #func arguement
        jal     fact
        move    $t0, $v0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 4
        la      $a0, nl
        syscall

        #######call func again
        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 5 #HOP challenge 
        syscall
        move    $a0, $v0
        
        #li      $a0, 7
        jal     fact

        move    $t0, $v0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall

