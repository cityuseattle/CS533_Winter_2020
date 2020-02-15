#HOP6 - second challenge by Gabby Wargin
            
            .data
answer:     .asciiz "your answer is..."
            .text


main:
  

    li         $v0, 16          # represents the n value of fibonacci number. 16 = val in c++ example

    move       $s1, $v0          # move value to s1

    beqz       $s1 zero          #if n=0 return 0
    beq        $s1, 1, one       #if n=1 return 1

    j fib                        #if n doesn't equal 1 or 0 jump to fib

zero:
    move      $a0, $s1          #if n = 0 move s1 to a0 and 
    j end                       #jump to end
    

one:
    li        $v0,1             #if n = 1 continue code
    

fib:   
    li        $s2, 0            # s2 = 0 and will increase until it's equal to $s1 in fib:
    li        $s3, 0            # this will hold the most recent fib number
    li        $s4, 1            # this will hold the second most recent fib number

fib_loop: 
    addi    $s2, $s2, 1         # increment s2 for loop, 
    add     $s5, $s3, $s4       # add s2 to s4, store to s5
    addi,   $s4, $s3, 0         # add s3 to 0 and store to s4
    addi,   $s3, $s5, 0         # add s5 to 0 and store in s3
    bne     $s2, $s1, fib_loop  #branch if s2 does not equal s1. 

end:
    li      $v0, 4               #print string
    la      $a0, answer          #this string
    syscall


    
    li       $v0, 1             #print integer
    move     $a0, $s5           #answer
    syscall


    


  li $v0, 10                    #end program
  syscall