data
prompt: .asciiz "Enter an integer: "
respon: .asciiz "You entered "
endl:   .asciiz "\n"
        .text

main:
    #print string - Enter an integer:
    li      $v0, 4          # load system call code (4) to print a string into reg $v0
    la      $a0, prompt     # load address of prompt string into reg $a0
    syscall                 # perform syscall to print string stored in $a0 in console

    #read and store user input
    li      $v0, 5          # load system call code (5) to read an integer in reg $v0
    syscall                 # read integer value and store into reg $v0
    move    $t0, $v0        # copy the value of $v0 into temp reg $t0

    #print string - You entered:
    li      $v0, 4          # load system call (4) to print a string into reg $v0
    la      $a0, respon     # load address of respon string into reg $a0
    syscall                 # perform syscall to print string stored in $a0 on console

    #print user input
    li      $v0, 1          # load system call code (1) to print integer into reg $v0
    move    $a0, $t0        # copy the value of $t0 into $a0 (value to be printed)
    syscall                 # print value stored in $a0

    #print string - new line                
    li      $v0, 4          # load system call (4) to print a string into reg $v0        
    la      $a0, endl       # load address of respon string into reg $a0
    syscall                 # perform syscall to print string stored in $a0 on console

    li      $v0, 10         # load system call (10) to exit program into reg $v0 
    syscall                 # exit program