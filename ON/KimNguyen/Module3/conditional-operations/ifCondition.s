main: 
        li	$t0, 0 		# $t0, 0= 
        li      $t1, 0

        .data
hello:  .asciiz "Hello "
world:  .asciiz "World\n"
        .text

        bne $t0, $t1, print_world #bne "branch not equat" will be true and jump                            to excute the code starts from "print_world"                            label if (t0 != t1) adn skip the code                                   between the bne condition and "print_world"                             label if the condition false, it would cont                             executing the code

        li      $v0, 4
        la      $a0, hello
        syscall
        
print_world:
        li      $v0, 4
        la      $a0, world
        syscall

        li      $v0, 10
        syscall