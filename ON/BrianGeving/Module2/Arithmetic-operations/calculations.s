.data
n1:     .asciiz "\n"
.text

main:
        li $t0, 2           #$t0=2
        li $t1, 7           #$t1=7
        li $t2, 5           #$t2=5
        li $t3, 8           #$t3=8

        add $a0, $t0, $t3   #a0=t0+t3
        li $v0, 1           #print int
        syscall

        li $v0, 4           #print string
        la $a0, n1          #newline
        syscall

        addi $a0, $t2, 17        #a0=t2+17
        li $v0, 1           #print int
        syscall

        li $v0, 4           #print string
        la $a0, n1          #newline
        syscall

        sub $a0, $t0, $t1   #a0=t0-t1
        li $v0, 1           #print int
        syscall

        li $v0, 4           #print string
        la $a0, n1          #newline
        syscall

        mult $t1, $t2       #hi and lo registers
        mflo $a0            #lo in a0
        li $v0, 1           #print int 
        syscall

        li $v0, 4           #print string
        la $a0, n1          #newline
        syscall

        div $t1, $t2        #hi=remainder lo=quotient
        mflo $a0            #quotient in a0
        li $v0, 1           #print int
        syscall

        li $v0, 4           #print string
        la $a0, n1          #newline
        syscall

        mfhi $a0            #remainder in a0
        li $v0, 1
        syscall

        li $v0, 4           #print string
        la $a0, n1          #newline
        syscall

        rem $a0, $t1, $t0   #alternate one liner to get remainder this time for t1/t0
        li $v0, 1           #print int
        syscall

        li $v0, 4           #print string
        la $a0, n1          #newline
        syscall

        li $v0, 10          #end
        syscall