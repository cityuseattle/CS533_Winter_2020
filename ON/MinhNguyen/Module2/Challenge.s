        .data
sum:    .asciiz "sum of number: "
divi:   .asciiz "div of number is: "
mulp:   .asciiz "mul of number is: "
nl  :   .asciiz "\n"
        .text

main:

    li		$t1, 30		# $t1 =30 
    li      $t2, 5

    li      $v0, 4      #load print string service
    la      $a0, sum    #load argument sum
    syscall

    add     $a0, $t1, $t2   #a0 = t1 + t2
    move    $t3, $a0        #copy value of ao into t3
    addi    $a0, $t3, 7     #add immediately: t3 + 7
    li      $v0, 1          #load integer 
    syscall

    li      $v0, 4      
    la      $a0, nl     # newline
    syscall

    li      $v0, 4      #load print string service
    la      $a0, divi    #load argument divi
    syscall

    div     $a0, $t1, $t2   # Lo = t1/t2
    mflo    $a0             # Copy value from Lo into a0
    li      $v0, 1
    syscall  

    li      $v0, 4      
    la      $a0, nl     # newline
    syscall

    li      $v0, 4      #load print string service
    la      $a0, mulp    #load argument mulp
    syscall

    mult    $t1, $t2    # Lo = t1*t2
    mflo    $a0
    li      $v0, 1
    syscall

    li      $v0, 4      
    la      $a0, nl     # newline
    syscall

    li  $v0, 10
    syscall