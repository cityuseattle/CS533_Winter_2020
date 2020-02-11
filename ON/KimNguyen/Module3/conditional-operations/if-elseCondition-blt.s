main: 
        li	    $t0, 1 		# $t0, 0= 
        li      $t1, 0

        .data
g:     .asciiz "greater or equal to \n"
ng:    .asciiz "Not greater or equal to \n"
hello: .asciiz "Hello again\n"
        .text

        blt     $t0, $t1, else_statm # cont code bc this is false

        li      $v0, 4
        la      $a0, g
        syscall
        j, end_if

else_statm:        
        li      $v0, 4
        la		$a0, ng		
        syscall
        
end_if: #jump here bc t0 >= t1
        li      $v0, 4
        la      $a0, hello
        syscall

        li      $v0, 10
        syscall