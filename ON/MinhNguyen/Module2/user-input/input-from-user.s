        .data
prompt: .asciiz "Enter an integer: "
respon: .asciiz "You entered "      #assigning string values into arguments
endl:   .asciiz "\n"
        .text

main:
        li      $v0, 4  #load code 4 to use read string argument service
        la		$a0, prompt #load argument prompt into register $a0
        syscall #returns the register

        li		$v0, 5   #load code 5 to read the integer
        syscall
        move    $t0, $v0  #copies the value from register $v0 to $t0

        li      $v0, 4
        la      $a0, respon #load argument respon
        syscall

        li      $v0, 1  #load code 1 to print the previous integer
        move    $a0, $t0
        syscall

        li      $v0, 4
        la		$a0, endl #load argument endl
        syscall      

        li      $v0, 10 #load code 10 to exit
        syscall     