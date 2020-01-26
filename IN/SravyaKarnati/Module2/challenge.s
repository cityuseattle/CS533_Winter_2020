	 	.data
msg1:   .asciiz " sum of number is: "
msg2:	.asciiz "\n division result is: "
msg3:	.asciiz "\n mult result is: "
	 	.text
         
main:
        li	 $t1, 30
        li	 $t2, 5

        li		$v0, 4
        la		$a0, msg1
        syscall

        add	 	$a0, $t1, $t2		
		addi    $a0, $a0, 17
        li	 	$v0,  1
		syscall

        div 	$t1, $t2
        mflo	$t3

        li		$v0, 4
        la		$a0, msg2
        syscall

        li		$v0, 1
        move	$a0, $t3
        syscall        

        mult  $t1, $t2      	
        mflo  $t3            

        li	 $v0, 4        
        la	 $a0, msg3      
        syscall              

        li	 $v0,  1        
        move   $a0,  $t3      
        syscall 	          

        li	 $v0, 10
        syscall