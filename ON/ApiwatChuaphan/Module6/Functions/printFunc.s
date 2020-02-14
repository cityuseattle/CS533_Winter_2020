    .data
msg: .asciiz "Hello everyone, thi is function \n"
    .text

display:
    li $v0, 4
    la $a0, msg
    syscall

    jr $ra

main:
    jal display

    li $v0, 10
    syscall