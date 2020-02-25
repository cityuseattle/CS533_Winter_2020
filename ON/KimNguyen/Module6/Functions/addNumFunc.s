addNums:
        add     $v1, $a0, $a1
        jr      $ra     #jump to next instruction of jal addnums

main:   
        li      $a0, 6 #func argument: a0 = 6
        li      $a1, 9  
        jal     addNums #call fucn addNums and save address of next instruction in ra

        li      $v0, 1 #print int
        move    $a0, $v1
        syscall

        li      $v0, 10
        syscall
        