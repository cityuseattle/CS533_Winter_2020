main:

        li	$t0, 0 		              # $t0 = 0
        li      $t1, 0                        # t1 = 0

        .data
hello:  .asciiz "Hello "                    # Hello string
world:  .asciiz "World \n"                  # world string
        .text

        beq		$t0, $t1, end_if    # beq "brand equal" will be true and jump to
                                            #  execute the code starts from "end_if" label if (t0==ti)
                                            #and skip the code between the beq condition and "end_if" label
        li		$v0,4 		
        la		$a0, hello	
        syscall

end_if:                                    #the beq condition is true, so it jumps here "end if" label to
                                           #continue executing the code
    li		$v0, 4 		 
    la		$a0, world              	
    syscall

    li      $v0, 10
    syscall 
    
         #CHALLENGE QUESTION:  "What will be the output for the previous code if $t0 not equal to $t1?"
         #CHALLENGE ANSWER:     The output would be "Hello World" since the condition would be false, 
                                #the code in between will be read then the code that the branch holds will 
                                #also be read, thus "Hello World."
        
        