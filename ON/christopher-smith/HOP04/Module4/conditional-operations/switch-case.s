                    .data
zero_string:        .asciiz "choice is 0 \n"
one_string:         .asciiz "Choice is 1 \n"
two_string:         .asciiz "Choice is 2 \n"
three_string:       .asciiz "Choice is 3 \n"
user_input:         .asciiz "Choice is   \n"
Def_string:         .asciiz "Print default \n"

main:
        li		$t0, 0

        beq		$t0, $zero, zero          	# if $t0 == $zero then jump to "zero" label
        li      $t9, 1
        beq		$t9, $t9, one
        li      $t9, 2
        beq		$t9, $t9, two
        li      $t9, 50
        beq     $t9, $t9, three
        j		default

zero:
        li      $v0, 4
        la		$a0, zero_string
        syscall
        j       end_case					# jump to "end_case", similar to break in c++

one:
        li      $v0, 4
        la      $a0, one_string
        syscall
        j		end_case

two:
        li      $v0, 4
        la      $a0, two_string
        syscall
        j       end_case


fifty:
        li      $v0, 4
        la      $a0, three_string
        syscall
        j       end_case


user_input:
        li      $v0, 5
        syscall
        move 	$t0, $v0


dafault:
        li      $v0, 4
        la      $a0, Def_string
        syscall

end_case:
        li      $v0, 10
        syscall
