        .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "The prime factorization of "
is:     .asciiz "is "
comma:  .asciiz ","
n1:     .asciiz "\n"
        .text

main:
        li		$v0, 4                  # call string
        la		$a0, num                # print num string
        syscall

        li      $v0, 5                  # take input from user
        syscall
        move 	$t0, $v0                # store user input in t0

        li      $v0, 4                  # call string
        la      $a0, msg                # print msg string
        syscall

        li      $v0, 1                  # print integer
        move    $a0, $t0                # move t0 to a0 for printing
        syscall

        li      $v0, 4                  # call string
        la      $a0, is                 # print is string
        syscall

        li      $t1, 2                  # start loop counter at 2 (i=2 in C++)

while:
        bge		$t1, $t0, end_while	    # if true, jump to end_while, otherwise continue to loop

        div		$t0, $t1                # mfhi = rem = t0 % t1, mflo = quotient = t0/t1
        mfhi    $t2                     # t2 = t0 % t1

        bnez    $t2, else               # check t2!=0. if true jump to else, otherwise continue

        li      $v0, 1                  # print integer
        move    $a0, $t1                # move t1 to a0 for printing
        syscall

        li      $v0, 4                  # call string
        la      $a0, comma              # print comma string
        syscall

        mflo    $t0                     # update value of t0, t0=t0/t1 (or n=n/i)

        j		while				    # jump to while to check condition

else:
        addi    $t1, 1                  # i++

        j       while                   # jump to while loop to check condition

end_while: 
        li      $v0, 1                  # print integer
        move    $a0, $t0                # move t0 to a0 for printing
        syscall

        li      $v0, 4                  # call string
        la      $a0, n1                 # print n1 string
        syscall

        li      $v0, 10                 # end
        syscall
        
        