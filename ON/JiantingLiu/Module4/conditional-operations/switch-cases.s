                .data
zero_string:    .asciiz "Choice is 0 \n"
one_string:     .asciiz "Choice is 1 \n"
two_string:     .asciiz "Choice is 2 \n"
fifty_string:   .asciiz "Choice is 50 \n"
def_string:     .asciiz "Print default \n"
input:          .asciiz "Please enter a integer: "
                .text

main:
        li      $v0, 4
        la		$a0, input		# 
        syscall

        li		$v0, 5		#got input from user
        syscall
        move 	$t0, $v0		# $t0 = $v0 move the input to $t0

        beq     $t0, $zero, zero
        li      $t9, 1
        beq     $t0, $t9, one
        li      $t9, 2
        beq     $t0, $t9, two
        li      $t9, 50
        beq     $t0, $t9, fifty

        li      $v0, 4
        la      $a0, def_string
        syscall
        j		end_case				# jump to end_case
        
zero:
        li      $v0, 4
        la      $a0, zero_string
        syscall
        j		end_case	        
one:
        li      $v0, 4
        la      $a0, one_string
        syscall
        j		end_case	
two:
        li      $v0, 4
        la      $a0, two_string
        syscall
        j		end_case	
fifty:
        li      $v0, 4
        la      $a0, fifty_string
        syscall
        j		end_case	
end_case:
        li      $v0, 10
        syscall