main:
            li      $t0, 0          # t0=0
            li      $t1, 1          # t1=1

            .data
if:         .asciiz "If \n"
else:       .asciiz "Else \n"
hello:      .asciiz "Hello again \n"
            .text

            bge		$t0, $t1, else_statm	# if $t0 >= $t1 then brance to else_statm

            li      $v0, 4
            la		$a0, if		
            syscall
            j		end_if  		

else_statm:
            li      $v0, 4                  # it will jump here when t0=t1
            la		$a0, else		
            syscall

end_if: 
            li      $v0, 4
            la		$a0, hello		
            syscall

            li      $v0, 10
            syscall 
            
            
            
            