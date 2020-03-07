        .data
X:      .word 3, 2, 1, 8, 6 
N:      .word 5
msg:    .asciiz "The sum of the array elements is:  "
        .text

arr_square:
        li      $t0, 0 	            #t0 = 0 loop iterator
        li      $t5, 0              #t1=0 offset to access the memroy location
        j       end

main:
        la      $t3, X              #t3 = load base address of the array X
        la      $t2, N              # 5 number of elements loaded from N
        jal     arr_square          #call arr_square


loop:
        lw      $t4, 0($t3)          #load array
        addi    $t3, $t3, 4          # increment for every 4 bytes in array

        add     $t0, $t0, $t4        # update sum


end:

        blt     $t3, $t2, loop      #branch if t2 is less than t3. if they are equal then continue to end

        li      $v0, 4              # print msg string
        la      $a0, msg
        syscall

        li      $v0, 1              # print answer = sum of array
        addi    $a0, $t0, 0
        syscall

        li $v0, 10                  #exit
        syscall


          
