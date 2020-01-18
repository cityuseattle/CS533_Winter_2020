main:
        li $t0, 5
        li $t1, 2

        bge $t0, $t1, else_statm

        add $a0, $t0, $t1
        li  $v0, 1
        syscall
        j end_if_statement

else_statm:
        sub $a0, $t0, $t1
        li  $v0, 1
        syscall
        
end_if_statement:
        li $v0, 10
        syscall