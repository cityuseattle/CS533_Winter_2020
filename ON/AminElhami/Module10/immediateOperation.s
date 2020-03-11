    .data
n1: .asciiz "\n"
    .text

main:
    li      $t0, 7             
    andi    $t1, $t0, 5        

    li      $v0, 1
    move    $a0, $t1            
    syscall

    li      $v0, 4
    la      $a0, n1             
    syscall

    xori    $t1, $t0, 5        

    li      $v0, 1
    move    $a0, $t1           
    syscall

    li      $v0, 4
    la      $a0, n1          
    syscall

    ori     $t1, $t0, 5    

    li      $v0, 1
    move    $a0, $t1       
    syscall

    li      $v0, 4
    la      $a0, n1   
    syscall

    li      $v0, 10
    syscall 