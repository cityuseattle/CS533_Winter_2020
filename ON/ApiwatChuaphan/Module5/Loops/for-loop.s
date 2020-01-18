    .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "Hello \n"
        .text

main:
        li $v0, 4
        la $a0, num
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        li $t0, 0

for_loop:
        bge $t0, $t1, exit

        li $v0, 4
        la $a0, msg
        syscall
        addi $t0, 1

        j for_loop

exit:
        li $v0, 10
        syscall