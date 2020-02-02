main:
        li $t0, 2                   #t0=5
        li $t1, 5                   #t1=2

        bge $t0, $t1, else_statm    #branch if t0>=t1 (false)

        add $a0, $t0, $t1
        li $v0, 1
        syscall
        j end_if_statement

else_statm:
        sub $a0, $t0, $t1           #a0=t0-t1
        li $v0, 1                   #print
        syscall

end_if_statement:
        li $v0, 10                  #exit
        syscall