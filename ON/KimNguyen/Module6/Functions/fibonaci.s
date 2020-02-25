        .data
msg:    .asciiz "The answer is: "
        .text


fibonacci:
    beqz    $a0, return0                # if a0 == 0, jump to return0
    beq     $a0, 1, return1             # if a0 == 1, jump to return1
    
    li      $a1, 0      #int a =0 
    li      $a2, 1      #int b = 1
    li      $t0, 1      #loop iterator
    sub     $a0, $a0, 1 # n-2

fibo_loop:
    bgt     $t0, $a0, end_fibo_loop #if true jump to end_fibo_loop, else cont to next line

    add     $a3, $a1, $a2   # c = a + b
    move    $a1, $a2        #a = b 
    move    $a2, $a3        #b = c

    addi    $t0, $t0, 1     # loop iterator 

    j       fibo_loop

end_fibo_loop:
    move    $a1, $a3
    jr      $ra

return0:
    li      $a1, 0
    jr      $ra

return1:
    li      $a1, 1
    jr      $ra

main:
    li      $a0, 16     #func arguemnt: n = 16 
    jal     fibonacci   #func call           
    move    $t0, $a1

    li      $v0, 4      #print msg  
    la      $a0, msg
    syscall

    li      $v0, 1      #print int
    move    $a0, $t0
    syscall

    li      $v0, 10     #exit 
    syscall