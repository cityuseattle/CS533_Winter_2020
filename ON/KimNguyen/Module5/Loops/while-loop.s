            .data
num:        .asciiz "Please enter a number: "
thanku:     .asciiz "Thank You \n"
            .text

main: 
        li      $t0, 5 #t0=5 is the no. user have to input

while:
        beq     $t0, $t1, exit

        li      $v0, 4
        la      $a0, num
        syscall
        
        li      $v0, 5
        syscall
        move    $t1, $v0

        j		while				# jump to target
        

exit:
        li      $v0, 4
        la      $a0, thanku
        syscall

        li      $v0, 10
        syscall
        