        .data #telling assembler we're about to string it up and it will put it into memeory
prompt: .asciiz "Enter an interger: " #creating a string to be null terminated
respon: .asciiz "You entered " #creating a string 
endl:   .asciiz "\n" #creating a string
        .text #telling assembler to expect code

main: #where the code starts

        li      $v0, 4 #print string
        la      $a0, prompt 
        syscall

        li      $v0, 5 #read and put integer into v0
        syscall #integer now in v0
        move    $t0, $v0 #copies value of v0/our input into t0

        li      $v0, 4 # print string
        la      $a0, respon
        syscall

        li      $v0, 1 #print integer in v0
        move    $a0, $t0 #move value t0 to a0
        syscall    #the input value is now in memory, register a0

        li      $v0, 4 #print string 
        la	$a0, endl
        syscall

        li      $v0, 10 #exit program
        syscall       