main:
     li $t0, 2
     li $t1, 0

     .data
ifmsg: .asciiz "Greater \n"
elsmsg: .asciiz "Not Greater \n"
hello: .asciiz "Hello again!"
    .text

    ble $t0, $t1, else

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