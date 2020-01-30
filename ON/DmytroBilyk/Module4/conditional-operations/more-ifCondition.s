        .data
Thanku: .asciiz "\nThank you"
        .text

main:
        li  $t0, 2
        li  $t1, 5

        ble $t0, $t1 else_statm    # condition is false, jump to else statement

        sub $a0, $t0, $t1
        li  $v0, 1                 # print integer
        syscall
        j   end_if

else_statm:
        addi $a0, $t0, 20           
        li $v0, 1              
        syscall
        
end_if:
        li $v0, 4
        la $a0, Thanku
        syscall

        li $v0, 10              # End of code
        syscall
