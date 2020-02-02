            .data
Thanku:     .asciiz "\nThank you"
            .text

main:
            li $t0, 5
            li $t1, 2

            bgt $t0, $t1, else_statm    #branch if t0>t1 (true)

            sub $a0, $t0, $t1           #a0=t0-t1
            li $v0, 1                   #print
            syscall
            j end_if

else_statm:
            addi $a0, $t0, 20
            li $v0, 1                   #print
            syscall

end_if:                                 #jump here from main if cond false
            li $v0, 4                   #string
            la $a0, Thanku              #Thanku string
            syscall

            li $v0, 10                  #exit
            syscall
