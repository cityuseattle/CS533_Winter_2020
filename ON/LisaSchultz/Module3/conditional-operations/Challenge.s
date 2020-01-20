main:
            li      $t0, 2          # t0=2
            li      $t1, 5          # t1=5

            bge		$t0, $t1, end_if	# if $t0 >= $t1 then branch to end_if
            
            add		$a0, $t0, $t1		    # $a0 = $t0 + $t1
            li      $v0, 1                  # print int		
            syscall 		
        
end_if:            

            li      $v0, 10
            syscall 