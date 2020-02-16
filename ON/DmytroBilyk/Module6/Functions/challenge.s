        .data
nl:     .asciiz "The answer is: "
        .text

fibonacci:
        beqz    $a0, return1    # check if a0=0, return 0
        beq     $a0, 1, return2 # check if a0=1, return 1
        
        li      $t0, 0          # t0=0 loop iterator

        addi    $a0, -1         # update passed in value to -1(actually -2 but since we use bgt, we do -1)
        li      $v0, 0          # a = 0
        li      $v1, 1          # b = 1
        li      $t3, 0          # c initialized

        fibonacci_loop:
                bgt     $t0, $a0, end_fibonacci_loop
                add     $t3, $v0, $v1   # c = a+b           
                move    $v0, $v1        # a=b
                move    $v1, $t3        # b=c

                addi    $t0, $t0, 1

                j       fibonacci_loop       # jump to fibonacci loop to check the condition

        end_fibonacci_loop:
                jr      $ra             # quit loop

        return1:
                li      $v0, 0
                jr      $ra             # quit loop

        return2:
                li      $v0, 1  
                jr      $ra             # quit loop

main:
        li      $a0, 16          
        jal     fibonacci

        move    $t0, $v0

        li      $v0, 4
        la      $a0, nl
        syscall

        li      $v0, 1          # sys code for printing integer
        move    $a0, $t0        # move the value of v1 into a0
        syscall
        
        li  $v0, 10
        syscall