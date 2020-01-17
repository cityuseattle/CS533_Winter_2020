        .data
msg1:   .asciiz " sum of numbers: "
msg2:   .asciiz "\n div of numbers is: "
msg3:   .asciiz "\n mul of numbers is: "
        .text

main:
        
        li		$t0, 30		        # $t0 =30 
        li		$t1, 5		        # $t1 =5

        add     $t2,$t0,$t1         # $a0= $t0+ $t1 (30+5)
        addi	$t2, $t2, 7			# $a0 = a0+ 7 ((30+5)+7)


        li       $v0,4
        la       $a0,msg1             #print string
        syscall

        li       $v0,1 		        # print integer
        move     $a0, $t2           # copy the value of t2 into a0
        syscall
        
        div     $t0, $t1            # Hi= remainder, Lo= quotient=$t0/$t1
        mflo    $t2                 #$a0= $t0/$t1

        li       $v0,4
        la       $a0,msg2             #print string
        syscall

        li       $v0,1 		        # print integer
        move     $a0, $t2           # copy the value of t2 into a0
        syscall

        mult    $t0, $t1            #The result is stored in two registers [Hi Lo]
        mflo    $t2

        li       $v0,4
        la       $a0,msg3             #print string
        syscall

        li       $v0,1 		        # print integer
        move     $a0, $t2           # copy the value of t2 into a0
        syscall

        li       $v0, 10
        syscall