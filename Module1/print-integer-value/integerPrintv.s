main:
        li $v0, 1
        li $a0, 17
        syscall

        li $v0, 1
        la $a0, nl
        syscall

        li $v0, 1
        li $a0, 71
        syscall
        
        li $a0, 4
        la $a0, 45
        syscall

        li $v0, 10
        syscall
