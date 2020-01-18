.data
sum:    .asciiz " sum of numbers: "
divide:    .asciiz "\n div of numbers is: "
multiply:    .asciiz "\n mul of numbers is: "
.text
main:
        li $t1, 30      #immediate value 30 into t1
        li $t2, 5       #immediate value 5 into t2

        li $v0, 4       #print string
        la $a0, sum     #print sum prompt
        syscall

        li $v0, 1       #print int
        add $t0, $t1, $t2 #put t1+t2 into $t0
        addi $a0, $t0, 7  #put t0+7 into $a0
        syscall         

        li $v0, 4       #print string
        la $a0, divide     #print div prompt
        syscall

        li $v0, 1       #print int
        div $t1, $t2    #t1/t2
        mflo $a0        #quotient in a0
        syscall

        li $v0, 4       #print string
        la $a0, multiply     #print mul prompt
        syscall

        li $v0, 1       #print int
        mult $t1, $t2   #t1*t2
        mflo $a0        #150 well within 32 bits so lo?
        syscall

        li $v0, 10      #end
        syscall

