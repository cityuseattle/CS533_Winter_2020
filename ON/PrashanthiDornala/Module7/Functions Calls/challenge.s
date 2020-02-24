addTwo:
        add     $t0, $a0, $a1           #t0=a0+a1 adds content of a0 and a1
        move    $v0, $t0                #v0=t0 moving contents of t0 to vo
        jr      $ra

doSomething:
        addiu   $sp, $sp, -12           # aalocate space for the $sp registers we will use

        sw      $s0, 0($sp)             #save register values
        sw      $s1, 4($sp)
        sw      $ra, 8($sp)

        move    $s0, $a0                # initialize $s0 and $s1 with x and y respectively
        move    $s1, $a1

        jal     addTwo                  #call addTwo with x and y, which are already in place

        li      $t1, 10
        add     $v0, $v0, $t1           #v0=v0+t1
        
        lw      $ra, 8($sp)             #restore registers, deallocate and return
        lw      $s1, 4($sp)
        lw      $s0, 0($sp)
        addiu   $sp, $sp, 12
        jal     $ra
        
main:
        li      $a0, 20                 #a0=20
        li      $a1, 10                 #a1=10
        jal     doSomething

        move    $t0, $v0                #save the returned value in $t0

        li      $v0, 1
        move    $a0, $t0                #print integer
        syscall

        li      $v0, 10                 #exit
        syscall
