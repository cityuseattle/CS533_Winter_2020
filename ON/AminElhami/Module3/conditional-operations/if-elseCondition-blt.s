main:
     li $t0, 2
     li $t1, 1

     .data
ifmsg: .asciiz "Greater or Equal \n"
elsmsg: .asciiz "Not Greater or Equal \n"
hello: .asciiz "Hello again!"
    .text

    blt $t0, $t1, else

    li $v0, 4
    la, $a0, ifmsg
    syscall
    j end_if
    
    else: 
        li $v0, 4
        la $a0, elsmsg
        syscall

    end_if:
       li $v0, 4
       la $a0, hello
       syscall    

    li $v0, 10
    syscall 