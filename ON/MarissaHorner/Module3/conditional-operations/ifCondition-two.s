main:
        li		$t0, 0		    # $t0 =0 
        li		$t1, 1		    # $t1 =1

        .data
hello:  .asciiz "Hello "        # Hello string
world:  .asciiz "World \n"      # world string
        .text

        beq		$t0, $t1, end_if	# beq "branch equal" will be true and jump to
                                    # execute the code starts from "end_if" label if (t0=t1)
                                    # and skip the code between the beq condition and "end_if" label
        li		$v0, 4
        la		$a0, hello 
        syscall

end_if:                             # The brq condition is true, so it jumps here "end_if" label to
                                    # continue executing the code
        li		$v0, 4
        la		$a0, world
        syscall

        li $v0,10
        syscall

        
        
        
        
        
        
        