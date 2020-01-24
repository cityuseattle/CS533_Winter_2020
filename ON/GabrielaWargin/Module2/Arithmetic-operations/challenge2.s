             .data
msg1:        .asciiz "sum of numbers "  
msg2:        .asciiz "\ndiv of numbers is: " 
msg3:        .asciiz "\nmul of numbers is: " 
             .text

main:
        li      $t0, 30;        #t0 = 30
        li      $t1, 5;         #t1 = 5

        li      $v0, 4
        la		$a0, msg1        #print string
        syscall 

        add     $t2, $t0, $t1   #t2 + t0 + t1 (30 + 5)
        addi    $a0, $t2, 7     #a0 = t2 + 7 (35 + 7)
        li      $v0, 1          #print a0 = 42
        syscall

        li      $v0, 4
        la		$a0, msg2       #print string
        syscall

        div     $t0, $t1        #divide t0/t1 (30/5)
        mflo    $a0             #where divison answer is stored
        li      $v0, 1          #print a0 = 6
        syscall

        li      $v0, 4
        la		$a0, msg3       #print string 
        syscall
        
        mult    $t0, $t1        #since smaller numbers are multiplied answer is in lo = a0 (30 * 5)
        mflo    $a0             #a0 = mflo
        li      $v0, 1          #print a0
        syscall
        
        li      $v0, 10         #exit program
        syscall
