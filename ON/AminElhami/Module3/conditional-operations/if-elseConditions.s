main:
     li $t0, 0
     li $t1, 2

     .data
ifmsg: .asciiz "If \n"
elsmsg: .asciiz "Else \n"
hello: .asciiz "Hello again!"
    .text

    bge $t0, $t1, target1

    li $v0, 4
    la, $a0, ifmsg
    syscall
    j end_if
    
    target1: 
        li $v0, 4
        la $a0, elsmsg
        syscall

    end_if:
       li $v0, 4
       la $a0, hello
       syscall    

    li $v0, 10
    syscall 