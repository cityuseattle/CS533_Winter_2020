main:
        li  $t0, 2  # t0=2
        li  $t1, 5  # t1=5

        .data
answer:  .asciiz "Answer is "  
        .text

        bge $t0, $t1 if     # to check t0<t1, use bge so it returns true if(t0>=t1) and if in that case it will
                                    # jump to the else statement label because t0=t1

        li  $v0, 4
        la  $a0, answer 
        syscall
if:
    add     $a0, $t0, $t1   # add t1 and t2
    li      $v0, 1          # print integer
    syscall

li  $v0, 10
syscall
