.data
msg1:   .asciiz "Mult result is "
.text

main:
    li $t1, 30
    li $t2, 5

    mult $t1, $t2   #$t1*$t2
    mflo $t3        #copy lo to $t3

    li $v0, 4       #print string
    la $a0, msg1    #load address of string
    syscall

    li $v0, 1       #print int
    move $a0, $t3   #copy $t3 into $a0
    syscall
    
    li $v0, 10      #end
    syscall
