addTwo:
        add     $t0, $a0, $a1
        move    $v0, $t0
        jr      $ra

doSomething:
        addiu   $sp, $sp, -12

        sw      $s0, 0($sp)
        sw      $s1, 4($sp)
        sw      $ra, 8($sp)

        move    $s0, $a0
        move    $s1, $a1

        jal     addTwo

        li      $t1, 10
        add     $v0, $v0, $t1
        
        lw      $ra, 8($sp)
        lw      $s1, 4($sp)
        lw      $s0, 0($sp)
        addiu   $sp, $sp, 12
        jal     $ra
        
main:
        li      $a0, 20
        li      $a1, 10
        jal     doSomething

        move    $t0, $v0

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall
