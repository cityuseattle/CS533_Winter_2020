        .data
prompt: .asciiz "Enter an integer: "
sum:    .asciiz "The final result is "
endl:   .asciiz "\n"
        .text

main:
        li $v0,4
        la $a0, prompt      #enter the first integer 
        syscall

        li $v0, 5
        syscall     #read input
        move $t1, $v0

        li $t0, 0   # while condition control number
        li $t2, 0   # sum stored at $t2
while:
        beq		$t0, $t1, exitt	# if input == 0 then jump to exit

        add		$t2, $t1, $t2		# $t0 = $t1 + $t2  

        li $v0,4
        la $a0, prompt      #please enter a integer
        syscall

        li $v0, 5
        syscall         #read input from user
        move $t1, $v0

        j	while				# jump to while
        
exitt:  
        li $v0,4
        la $a0, sum     
        syscall

        li $v0, 1
        move $a0, $t2   #print final result of sum
        syscall

        li $v0, 10
        syscall