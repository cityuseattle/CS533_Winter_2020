                .data
prompt:         .asciiz "Enter an integer:\n"
respon:         .asciiz "You entered "
zero_string:    .asciiz "\nChoice is 0 \n"
one_string:     .asciiz "\nChoice is 1 \n"
two_string:     .asciiz "\nChoice is 2 \n"
fifty_string:   .asciiz "\nChoice is 50 \n"
Def_string:     .asciiz "Print default \n"
                .text
main:
        li		$v0, 4
        la		$a0, prompt
        syscall

        li      $v0, 5
        syscall
        move 	$t0, $v0

        li      $v0, 4
        la		$a0, respon
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall 
        
        

        beq		$t0, $zero, zero	# if $t0 == to zero then jump to "zero" label
        li		$t9, 1
        beq		$t9, $t9, one
        li      $t9, 2
        beq     $t9, $t9, two
        li      $t9, 50
        beq     $t9, $t9, fifty
        j		default				# jump to default

zero:
        li      $v0, 4
        la		$a0, zero_string
        syscall
        j		end_case				# jump to end_case, similar to break in c++

one:
        li      $v0, 4
        la		$a0, one_string
        syscall
        j		end_case				# jump to end_case

two:
        li      $v0, 4
        la		$a0, two_string
        syscall
        j		end_case				# jump to end_case

fifty:
        li      $v0, 4
        la		$a0, fifty_string
        syscall
        j		end_case				# jump to end_case
         
        

default:
        li      $v0, 4
        la		$a0, Def_string
        syscall

end_case:
        li      $v0, 10
        syscall
        
         
        
         
        
         
        