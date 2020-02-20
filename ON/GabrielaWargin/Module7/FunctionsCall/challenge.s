#add Two definition
addTwo:
    #map add to $t0
    add $t0, $a0, $a1   # 20 + 10 = t0 = 30
    move $v0, $t0       # v0 = 30
    jr $ra              # where addTwo returns to

doSomething:
    addiu $sp, $sp, -16 # allocate 16 bytes for $sp registers + $ra.

    #save the registers values
    sw $s0, 0($sp) # map x to s0
    sw $s1, 4($sp) # map y to s1
    sw $s2, 8($sp) # map a to s2
    sw $ra, 12($sp) #optimization: 10 doesn't need to be in a stack. 

    #x initialize $s0 and $s1 with x and y, respectively
    move $s0, $a0 #x = a0 = s0
    move $s1, $a1 #y = a1 = s1

    #call addTwo with x and y which are in place.
jal addTwo

    #move the result to $s1
    move $s2, $v0

    #call addTwo with y and x
    move $a0, $s1 # move s1 to a0
    move $a1, $s0 #move s0 to a1
jal addTwo    # jump to addTwo

    #compute final result
    add $v0, $v0, 10 # v0 = 30 + 10...v0 =40

    #restore registers, deallocate and return
    lw $ra, 12($sp)
    lw $s2, 8($sp)
    lw $s1, 4($sp)
    lw $s0, 0($sp)		
    addiu $sp, $sp, 16
    
jal $ra

main:
    li $a0, 20           #a0 = 20
    li $a1, 10           #a1 = 10
    jal doSomething      #jump to do something

    move $t0, $v0       #save the returning value of the function into t0
    
    li  $v0, 1          #print answer
    move $a0, $t0
    syscall

    li  $v0, 10         #exit 
    syscall