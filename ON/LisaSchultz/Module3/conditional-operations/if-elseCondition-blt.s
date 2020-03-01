main:
            li		$t0, 1		# $t0 = 1
            li		$t1, 0 		# $t1 = 0

            .data
g:          .asciiz "Greater or equal \n"
ng:         .asciiz "Not Greater or equal \n"
hello:      .asciiz "Hello again \n"
            .text

            blt		$t0, $t1, else_statm	# if $t0 < $t1 then else_statm

            li		$v0, 4 		
            la		$a0, g		
            syscall
            j		end_if				# jump to end_if

else_statm:
            li		$v0, 4		
            la		$a0, ng		
            syscall

end_if:
            li		$v0, 4 		
            la      $a0, hello
            syscall

            li      $v0, 10
            syscall 
            
            
            
            
            
            
            