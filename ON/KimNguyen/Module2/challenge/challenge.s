        .data
nl:     .asciiz "\n"
sumNum: .asciiz "sum of numbers:"
divNum: .asciiz "div of numbers is: "
mulNum: .asciiz "mul of numbers is: "
        .text

main: 
        li $t1, 30
        li $t2, 5

        li $v0, 4 #print string
        la $a0, sumNum #print string stored in "sumNum"
        syscall

        add $a0, $t1, $t2 #$a0 = $t1 + $t2

        addi $a0, 7 #result of $a0 above + 7
        li $v0, 1 #system code to print an interger
        syscall #print the interger

        li $v0, 4 #print string
        la $a0, nl #print next line
        syscall

        li $v0, 4 #print string
        la $a0, divNum #print string stored in "divNum"
        syscall

        div $a0, $t1, $t2 #$a0 = $t1 / $t2
        li $v0, 1 #system code to print an interger
        syscall #print the interger
        
        li $v0, 4 #print string
        la $a0, nl #print next line
        syscall

        li $v0, 4 #print string
        la $a0, mulNum #print string stored in "mulNum"
        syscall

        mul $a0, $t1, $t2 #$a0 = $t1 * $t2
        li $v0, 1 #system code to print an interger
        syscall #print the interger

        li $v0, 10 #system code to exit
        syscall