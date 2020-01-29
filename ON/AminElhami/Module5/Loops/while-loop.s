        .data
num:    .asciiz "Please enter a number: "
Thanku: .asciiz "Thank you"
        .text

main:
        li      $t0, 5

while:
        beq     $t0, $t1, exit

        li      $v0, 4
        la		$a0, num
        syscall

        li      $v0, 5
        syscall
        move 	$t1, $v0

        j while

exit:
        li      $v0, 4
        la		$a0, Thanku
        syscall

        li      $v0, 10
        syscall
        
        
       