subTwo:
        sub     $t0, $a0, $a1
        move    $v0, $t0
        jr      $ra

doSomething:
        addiu   $sp, $sp, -16

        sw      $s0, 0($sp)
        sw      $s1, 4($sp)
        sw      $s2, 8($sp)
        sw      $ra, 12($sp)

        move    $s0, $a0
        move    $s1, $a1

        jal     subTwo

        move    $s2, $v0

        move    $a0, $s1
        move    $a1, $s0
        jal     subTwo
        
        add     $v0, $v0, $s2
        
        lw      $ra, 12($sp)
        lw      $s2, 8($sp)
        lw      $s1, 4($sp)
        lw      $s0, 0($sp)
        addiu   $sp, $sp, 16
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
