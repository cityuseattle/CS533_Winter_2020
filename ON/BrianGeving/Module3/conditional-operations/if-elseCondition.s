main:
        li $t0, 0                        #t0=0
        li $t1, 1                        #t1=1

        .data
if:     .asciiz "If \n"                 
else:   .asciiz "Else \n"               
hello:  .asciiz "Hello again \n"
        .text

        bge $t0, $t1, else_stats        #branch to else_stats if t0>=t1

        li $v0, 4
        la $a0, if
        syscall
        j end_if

else_stats:                              #jump here if bge is true
        li $v0, 4
        la $a0, else
        syscall

end_if:
        li $v0, 4
        la $a0, hello
        syscall

        li $v0, 10
        syscall
