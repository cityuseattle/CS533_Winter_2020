main:
        li      $t0, 2                           #$t0 = 5
        li      $t1, 5                           #t1 =2

        bge     $t0, $t1, else_statm            # This condition is false, continue executing the code

        add     $a0, $t0, $t1                   # a0 = t0 + t1 // = 2+ 5
        li      $v0, 1                          # print integer
        syscall
        j	end_if_statement                # We don't want to execute the else_statement
                                                # so jump to end_if_statement

else_statm: 
        sub	$a0, $t0, $t1		        # will
        li      $v0, 1                          # skip
        syscall                                 # this part

end_if_statement:    
        li      $v0, 10                          #end of code
        syscall