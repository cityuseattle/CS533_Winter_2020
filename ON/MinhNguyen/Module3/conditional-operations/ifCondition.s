main:
        li		$t0,0		# $t0 = 
        li      $t1,0

        .data
hello:  .asciiz "Hello "
world:  .asciiz "World \n"
        .text

        bne		$t0, $t1, print_world	# branch not equal is true (t0 != t1) therefore it will
                                        # execute the code starts from "print_world" label below
                                        # and skip the hello code shown below 
                                        # if the condition is False, the label will be skip and the
                                        # hello code will be executed
        
        li      $v0, 4
        la      $a0, hello              # hello code
        syscall

print_world:                            # the label to be executed as the condition is true

        li      $v0, 4
        la      $a0, world
        syscall

        li  $v0, 10
        syscall