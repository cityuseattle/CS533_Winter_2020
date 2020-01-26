main:
        li $t0, 2                        #t0=2
        li $t1, 5                        #t1=5

        blt $t0, $t1, less_than          #branch to less_than if t0<t1

        li $v0, 10                       #otherwise just end without doing anything
        syscall

less_than:                               #branch here if blt is true (it is)
        li $v0, 1
        add $a0, $t0, $t1                #a0=t0+t1
        syscall

        li $v0, 10                       #end
        syscall
