             .data
prompt: .asciiz "Enter an integer: "    # assign promp string
zero_string: .asciiz "Choice is 0 \n"
one_string:  .asciiz "Choice is 1 \n"
two_string:  .asciiz "Choice is 2 \n"
fifty_string:  .asciiz "Choice is 50 \n"
Def_string:  .asciiz "Print default \n"
             .text

main:
        li  $v0, 4          # print string
        la  $a0, prompt 	# load address of prompt string
        syscall

        li  $v0, 5 	        # reads an integer
        syscall
        move $t0, $v0		# copy the value of t0 into $v0

        beq $t0, $zero, zero   # if $t0 == to zero then jump to zero label
        li  $t9, 1
        beq $t0, $t9, one
        li  $t9, 2
        beq $t0, $t9, two
        li  $t9, 50
        beq $t0, $t9, fifty
        j   default

zero:
        li $v0, 4
        la $a0, zero_string              
        syscall
        j  end_case             # jump to end_case, similar to break in c++
        
one:
        li $v0, 4
        la $a0, one_string
        syscall
        j  end_case

two:
        li $v0, 4
        la $a0, two_string
        syscall
        j  end_case
        
fifty:
        li $v0, 4
        la $a0, fifty_string
        syscall
        j  end_case

default:
        li $v0, 4
        la $a0, Def_string
        syscall
        j  end_case

end_case:
        li $v0, 10              # End of code
        syscall
