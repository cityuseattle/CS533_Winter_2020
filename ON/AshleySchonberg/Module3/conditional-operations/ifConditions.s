main:
        li		$t0, 0		    # $t0 = 0
        li      $t1, 0          # $t1 = 0

        .data
hello:  .asciiz "Hello "
world:  .asciiz "World \n"
        .text

        bne		$t0, $t1, print_world	# if $t0 != $t1 then target
        
        li      $v0, 4
        la		$a0, hello 
        syscall

print_world:

        li      $v0, 4
        la      $a0, world
        syscall

        li $v0, 10
        syscall
        
        
        