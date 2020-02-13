        .data
i:      .asciiz "Please enter an integer: "
k:      .asciiz "The result is: "
        .text

main:
        li $v0, 4
        la $a0, i      #enter the integer 
        syscall

        li $v0, 5
        syscall     
        move $t0, $v0

        li $t1, 0   # Used to detect whether the input is 0
        li $t2, 0   # The resule is $t2
while:
        beq		$t1, $t0, endl	# if input == 0 then jump to exit

        add		$t2, $t0, $t2		# $t1 = $t0 + $t2  

        li $v0, 4
        la $a0, i      #please enter an integer
        syscall

        li $v0, 5
        syscall         
        move $t0, $v0

        j	while				# jump to while
        
endl:  
        li $v0, 4
        la $a0, k     
        syscall

        li $v0, 1
        move $a0, $t2   #print result 
        syscall

        li $v0, 10
        syscall