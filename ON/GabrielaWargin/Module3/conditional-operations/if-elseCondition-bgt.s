main:
        li		$t0, 0                      #t0=1
        li		$t1, 0 		                #t1=0

            .data
if:         .asciiz "If \n"
else:       .asciiz "Else \n"
hello:      .asciiz "Hello again \n"
            .text

        bgt		$t0, $t1, else_statm	    # In this case, bgt condition is flase becasue t0==t1, so it will
                                            # continue executing the code

        li		$v0, 4 		                
        la		$a0, if	                    #it will print "if" here  	
        syscall
        j		end_if				        #we don't want to execute the else statement part, so jump to
                                            #end if label to contd executing the rest of the code after the else part
else_statm:
        li		$v0, 4 		                # it jumps here and executes the "else" because t0 is not ,+ t1
        la      $a0, else                   # then continues executing the code
        syscall
end_if:                                     # it will jump here to continue executing the code
        li		$v0, 4 		
        la		$a0, hello           		# print "Hello again"
        syscall
        
        li		$v0, 10 		
        syscall
        
        
        

        
        
        
        