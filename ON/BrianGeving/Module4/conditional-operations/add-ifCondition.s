main:
        li $t0, 2           #t0=2
        li $t1, 5           #t1=5

        bge $t0, $t1, Cont  #go to Cont if t0>=t0 (false)

        add $a0, $t0, $t1   #a0=t0+t1
        li $v0, 1           #print int
        syscall

Cont:
        li $v0, 10          #exit
        syscall