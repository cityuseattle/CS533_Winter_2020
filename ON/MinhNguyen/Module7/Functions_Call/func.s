fourth:
    jr  $ra

third:
    addiu   $sp, $sp, -4
    sw      $ra, 0($sp)
    jal     fourth
    lw      $ra, 0($sp)
    addiu   $sp, $sp, 4
    jr      $ra 

second:
    addiu   $sp, $sp, -4
    sw      $ra, 0($sp)
    jal     third
    lw      $ra, 0($sp)
    addiu   $sp, $sp, 4
    jr      $ra 

first:
    addiu   $sp, $sp, -4
    sw      $ra, 0($sp)
    jal     second
    lw      $ra, 0($sp)
    addiu   $sp, $sp, 4
    jr      $ra 

main:
    jal first       # call first function, ra= add of next instruction

    li  $v0, 1      # Print int call
    li  $a0, 20     # a0 = 20
    syscall


    li  $v0, 10
    syscall