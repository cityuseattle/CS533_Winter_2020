    .data
prompt: .asciiz "Enter an integer: "
respon: .asciiz "You entered "
endl:   .asciiz "\n"
        .text
main:
    li $v0, 4           #print string
    la $a0, prompt
    syscall

    li $v0, 5           #read in integer
    syscall
    move $t0, $v0

    li $v0, 4           #print string
    la $a0, respon
    syscall
    
    li $v0, 1           #print string
    move $a0, $t0       #send value from t0 to a0
    syscall

    li $v0, 4           #print endl
    la $a0, endl
    syscall

    li $v0, 10          #quit
    syscall