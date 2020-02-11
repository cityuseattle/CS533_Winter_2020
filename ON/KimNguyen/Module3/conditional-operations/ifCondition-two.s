main: 
        li	    $t0, 0 		# $t0, 0= 
        li      $t1, 0

        .data
hello:  .asciiz "Hello "
world:  .asciiz "World\n"
        .text

        beq     $t0, $t1, end_if #bne "branch equal" will be true and jump to                            excute the code starts from "end_if" label if                           (t0 = t1) adn skip the code between the beq                             condition and "end_if" label if the condition                           false, it would cont executing the code

        li      $v0, 4
        la      $a0, hello
        syscall
        
end_if:
        li      $v0, 4
        la      $a0, world
        syscall

        li      $v0, 10
        syscall